using UnityEngine;
using System.Collections.Generic;
using System.Collections;
using System.Xml;
using System;
using System.IO;
using System.Diagnostics;
using System.Net;
using Utils.Thread.LoadFile;
using System.Threading;

using Sacu.Utils;
using Sacu.Collection;
using Sacu.Events;
using Sacu.Factory.Worker;
using Sacu.Utils;
using Utils;

using XLua;

namespace Graphs
{
    public class AssetBundleRemoteGraphWorker : SAGraphWorker
    {
        
        private const string MD5_NAME = "VersionMD5.xml";
        //多线程加载
        private Stopwatch stopWatch;
        //数据缓存
        protected Dictionary<string, string> version;
        protected Dictionary<string, string> newVersion;

        private string localFilePath;

        private XmlDocument convertXML;
        private Dictionary<string, string>.Enumerator resListEN;
        //消息对象
        protected SAFactoryEvent factoryEvent;
        protected ProgressData progressData;

        private bool LuaComplete;
        
        private const int buffer_lenth = 10240;//单次读取长度
        //private long total;//总
        //private long current;//当前
        //private byte[] fileBytes;

        /// <summary>
        /// UI
        /// </summary>
        protected UISlider slider;
        protected int totalNum;
        protected int currentNum;

        private AssetBundle[] abs;
        private int abs_position;
        /// <summary>
        /// 加载类前期跳过lua初始化,等程序加载完毕再进行lua初始化
        /// </summary>
        override protected void callLuaFun(string funName, System.Object value = null)
        {
            
        }
        protected override void init()
        {
            //这里初始化Lua
            originName = patchName.Replace(SAAppConfig.PrefabUIDir, "");
            luaName = displayName.Substring(displayName.LastIndexOf(".") + 1);
            setActive(false);//初始化之后
            HideVec3 = SAManager.Instance.HideVec3;
            IsNew = false;
            if (_start)
            {
                IsMainStart = true;
            }
            //ui对象引用
            slider = getComponentForGameObjectName<UISlider>("Slider");
            stopWatch = new Stopwatch();
            progressData = new ProgressData();
            factoryEvent = new SAFactoryEvent(SAACollection.PROGRESS, progressData);
        }
        protected override void onSrart(System.Object args)
        {
            base.onSrart(args);
            SAUtils.Log("load resource...");
            if (true || !PlayerPrefs.HasKey("resources_version") || PlayerPrefs.GetInt("resources_version") != SAGameVersion.Instance.ioc_version)
            {//更新资源
                refreshLocalVersionInfo();
            } else
            {
                SAUtils.Log("load version...");
                dispatchEvent(SAACollection.REFRESH + ActionCollection.LocalFile + SAACollection.COMPLETE);//更新完成
            }
                
            //initSocket();//临时直接初始化socket
        }
        protected override void onRegister()
        {
            base.onRegister();
        }

        protected override void onRemove()
        {
            base.onRemove();
            //removeEvent();
        }
        override protected void luaValidate(string type)
        {

        }
        /// <summary>
        /// 更新本地版本信息缓存
        /// </summary>
        protected void refreshLocalVersionInfo()
        {
            SAUtils.Log("refresh version...");
            //获取当前(旧的)版本
            version = getXmlToDictionary(SALang.getLocalXMLWithName(MD5_NAME).DocumentElement.ChildNodes);
            //加载远程(最新)版本信息
            progressData.info = "加载版本文件信息...";
            addEventDispatcherWithHandle(SAACollection.REFRESH + ActionCollection.LocalFile + SAACollection.COMPLETE, updateLocalFileComplete);//资源加载完成
            //加载
            if (SAAppConfig.UIRelease)
            {
                addEventDispatcherWithHandle(SAACollection.REFRESH + ActionCollection.LocalFile, updateLocalFile);//资源加载
                StartCoroutine(OnUpdateResource());
            }
            else {
                dispatchEvent(SAACollection.REFRESH + ActionCollection.LocalFile + SAACollection.COMPLETE);//更新完成
            }
        }
        private Dictionary<string, string> getXmlToDictionary(XmlNodeList nodeList)
        {
            Dictionary<string, string> temp = new Dictionary<string, string>();
            XmlNode node;
            for (int i = 0; i < nodeList.Count; i++)
            {
                node = nodeList[i];
                if (node.Name.Equals("File"))
                {
                    temp.Add(node.Attributes.GetNamedItem("FileName").Value, node.Attributes.GetNamedItem("MD5").Value);
                }
            }
            return temp;
        }
        IEnumerator OnUpdateResource()
        {
            string random = DateTime.Now.ToString("yyyymmddhhmmss");
            string versionFile = SAGameVersion.asset_path + SAAppConfig.LanguagePlatform + "/" + MD5_NAME + "?rd=" + random;

            WWW www = new WWW(versionFile);
            yield return www;
            if (www.error != null)
            {
                //抱错喽~~~
				print ("抱错喽~~~ : " + versionFile);
                yield break;
            }
            SAUtils.Log("文件加载完毕");
            convertXML = SALang.stringConvertXML(www.text);//等待写入
            newVersion = getXmlToDictionary(convertXML.DocumentElement.ChildNodes);
            progressData.info = "更新资源...";

            resListEN = newVersion.GetEnumerator();
            totalNum = newVersion.Count;
            currentNum = 0;
            dispatchEvent(SAACollection.REFRESH + ActionCollection.LocalFile);
            yield return StartCoroutine(download());
        }

        private IEnumerator download()
        {
            if (resListEN.MoveNext())
            {
                string fileKey = resListEN.Current.Key;
                localFilePath = Path.Combine(SAAppConfig.RemotePath, fileKey);
                bool isExist = File.Exists(localFilePath);//判断本地文件

                progressData.info = "正在更新资源 : " + fileKey;
                dispatchEvent(SAACollection.REFRESH + ActionCollection.LocalFile);
                if (isExist)
                {
                    isExist = version.ContainsKey(fileKey) && version[fileKey].Equals(resListEN.Current.Value);
                    if (!isExist)
                    {
                        File.Delete(localFilePath);
                    }
                }
                if (!isExist)//需要下载
                {
                    progressData.name = resListEN.Current.Key;
                    stopWatch.Start();
                    //loadFileWithName(fileKey);
                    string remoteFilePath = SAGameVersion.asset_path + fileKey;
                    WWW www = new WWW(remoteFilePath);
                    yield return www;
                    if (www.error != null)
                    {
                        //抱错喽~~~
                        SAUtils.Log("抱错喽~~~ : " + remoteFilePath);
                        yield break;
                    }
                    SALang.writeLocalByteWithName(www.bytes, resListEN.Current.Key);
                }
                ++currentNum;
                yield return StartCoroutine(download());
            } else
            {
                progressData.info = "更新完毕";
                dispatchEvent(SAACollection.REFRESH + ActionCollection.LocalFile);
                downloadComplete();
            }
        }
        private void downloadComplete()
        {
            StopAllCoroutines();
            SALang.MakDirValid(SAAppConfig.RemotePath);

            convertXML.Save(Path.Combine(SAAppConfig.RemotePath, MD5_NAME));//写入本地最新XML
            version = newVersion;
            //资源缓存
            SACache.LoadLuaPackage(SAAppConfig.RemotePath, SAAppConfig.LanguagePlatform + "/" + SAAppConfig.LuaPathName);//lua 缓存
            //unity资源
            abs = new AssetBundle[(version.Count - 3) / 2 + 2];//Platform Platform.manifest lua.bytes other.manifest
            abs_position = 0;
            //shader
            loadAssetBundleManifest(SAAppConfig.LanguagePlatform + "s");
            //资源
            loadAssetBundleManifest(SAAppConfig.LanguagePlatform);
            for (int i = 0; i < abs.Length; ++i)
            {
                if (null != abs[i])
                {
                    abs[i].Unload(false);
                    abs[i] = null;
                }
            }
            SACache.getResDictionary(SAACollection.AtlasStr).Clear();

            abs_position = 0;
            removeEventDispatcher(SAACollection.REFRESH + ActionCollection.LocalFile);//资源加载
            dispatchEvent(SAACollection.REFRESH + ActionCollection.LocalFile + SAACollection.COMPLETE);//更新完成
        }
        private void loadAssetBundleManifest(string dir)
        {
            string _dir = Path.Combine(SAAppConfig.RemotePath, dir) + "/" + dir;
            if (File.Exists(_dir))
            {
                AssetBundle ab = AssetBundle.LoadFromFile(_dir);//加载依赖文件
                AssetBundleManifest abm = ab.LoadAsset<AssetBundleManifest>("AssetBundleManifest");
                abs[abs_position++] = ab;
                dependLoad(abm, dir, abm.GetAllAssetBundles());
            }
        }

        /**
         * 如果依赖环形 则会死循环(理论不会出现)
         */
        private void dependLoad(AssetBundleManifest abm, string dir, string[] depends)
        {
            for (int i = 0; i < depends.Length; ++i)
            {
                string[] cdepends = abm.GetAllDependencies(depends[i]);
                for (int j = 0; j < cdepends.Length; ++j)
                {
                    dependLoad(abm, dir, cdepends);
                }
                addDependToCache(depends[i], dir);
            }
        }

        private void addDependToCache(string dependName, string dir)
        {
            int dot = dependName.LastIndexOf('.');
            string contrast = dependName.Substring(0, dot);//缓存名称
            string cacheName = dependName.Substring(0, dependName.IndexOf('.'));//缓存集合
            
            Dictionary<string, System.Object> assetCache = SACache.getResDictionary(cacheName);
            if (null != assetCache && !assetCache.ContainsKey(contrast))
            {
                AssetBundle ab = AssetBundle.LoadFromFile(Path.Combine(SAAppConfig.RemotePath, dir + "/" +dependName));//加载依赖文件
                dependName = SAAppConfig.LocalDevDir.ToLower() + dependName.Substring(0, dot).Replace(".", "/") + dependName.Substring(dot);
                abs[abs_position++] = ab;
                dot = contrast.IndexOf(".") + 1;
                string tempContrast = contrast.Substring(dot);
                if (SAAppConfig.CacheModel || 
                    (cacheName.Equals(SAACollection.UIStr) && tempContrast.Length >= SAACollection.ComminLen && tempContrast.Substring(0, SAACollection.ComminLen).Equals(SAACollection.CommonStr)))
                {
                    assetCache[contrast] = ab.LoadAsset(dependName);
                } else if(cacheName.Equals(SAACollection.ShaderStr))
                {
                    string[] names = ab.GetAllAssetNames();
                    string tempKey;
                    string tempName;
                    int tempKeyBegin;
                    for (int i = 0; i < names.Length; ++i)
                    {
                        tempName = names[i];
                        tempKeyBegin = tempName.LastIndexOf("/") + 1;
                        tempKey = tempName.Substring(tempKeyBegin, tempName.Length - tempKeyBegin - SAACollection.MatSuffixLen);
                        assetCache[tempKey] = ab.LoadAsset(tempName);
                    }
                }
            }
        }
        

        private void updateLocalFile(SAFactoryEvent e)
        {
            //有UI后在这里控制显示进度、内容等
            progressData.info = string.Format("{0} kb/s", (progressData.current / 1024d / stopWatch.Elapsed.TotalSeconds).ToString("0.00"));
            slider.value = Convert.ToSingle(currentNum) / Convert.ToSingle(totalNum);
        }
        /// <summary>
        /// 资源加载完成
        /// </summary>
        /// <param name="e"></param>
        private void updateLocalFileComplete(SAFactoryEvent e)
        {
            removeEventDispatcher(SAACollection.REFRESH + ActionCollection.LocalFile + SAACollection.COMPLETE);//资源加载完成
            
            //初始化 AssetBundleRemoteLua
            string localFilePath = Path.Combine(SAAppConfig.LuaRelease?SAAppConfig.RemoteLuaDir : SAAppConfig.DevLuaDir, originName + ".lua");
            bool isExist = File.Exists(localFilePath);//判断本地文件
            if (isExist)
            {
                luaEnv = new LuaEnv();
                luaEnv.AddLoader(LuaFile);
                luaEnv.DoString("require '" + localFilePath + "'");
                //################以下按照流程顺序补齐lua操作
                base.callLuaFun(SAACollection.luaNew, this);//初始化
                base.callLuaFun(SAACollection.luaRegister);//注册
                base.callLuaFun(SAACollection.luaStart);//启动
                                                        //内部自动处理加载关闭以及接下来的执行任务
                base.callLuaFun(SAACollection.luaRegisterComplete);//启动完毕
            }
            SAUtils.Log("AssetBundleFactory complete");

			int w = Screen.width;
			int h = Screen.height;


            //test = Instantiate((GameObject)SACache.getObjectWithName("model/cheqiyu/cheqiyu"));
            //test.GetComponent<Animator>().Play("swim");
            
            //ProtoTypeEnum.CLogin.ToString()
            //GameObject test = Instantiate(SACache.getResWithName<GameObject>("Model.FightPanelUI.FightPanelMap"));
            //GameObject test = Instantiate(UnityEditor.AssetDatabase.LoadAssetAtPath<GameObject>("Assets/_Resources/Model/FightPanelUI/FightPanelMap.prefab"));
            //test.transform.FindChild("Ground").transform.localPosition = new Vector3(0, 0.7f, 0);
            //test.transform.FindChild("FourDimensional").transform.localPosition = new Vector3(0, 0.7f, 0);
            //SALaunch.UIRootCamera.gameObject.SetActive(false);
        }
    }
}
