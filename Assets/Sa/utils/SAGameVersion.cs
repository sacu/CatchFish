using System.Collections;
using System;
using System.IO;
using UnityEngine;
using System.Xml;
namespace Sacu.Utils
{
    public class SAGameVersion
    {
        public string ip;//地址
        public int port;//端口
        public string asset_ip;//资源地址
        public int asset_port;//资源端口
        public int ioc_version;//ioc版本
        public int data_version;//datatable版本
        public int resources_version;//资源版本
        public string language;//国际化
        public static string asset_path;//资源路径

        private static SAGameVersion instance;
        public static SAGameVersion Instance
        {
            get
            {
                if (null == instance)
                {
                    instance = new SAGameVersion();
                }
                return instance;
            }
        }
        public SAGameVersion()
        {

        }
        public IEnumerator loadVersion()
        {
            string random = DateTime.Now.ToString("yyyymmddhhmmss");

			string versionFile = (SAAppConfig.ConfigRelease ? SAAppConfig.VersionPath : SAAppConfig.DevResDir + SAAppConfig.DataDir) + SAAppConfig.versionXML + "?" + random;
            SAUtils.Log(versionFile);
            WWW www = new WWW(versionFile);
            yield return www;
			if (www.error != null && www.error.Length > 0)
            {
                SAUtils.LogError("error : " + www.error);
                yield break;
            }
            XmlDocument convertXML = SALang.stringConvertXML(www.text);
            ip = Convert.ToString(convertXML.GetElementsByTagName("ip").Item(0).InnerText);
            port = Convert.ToInt32(convertXML.GetElementsByTagName("port").Item(0).InnerText);
            asset_ip = Convert.ToString(convertXML.GetElementsByTagName("asset_ip").Item(0).InnerText);
#if UNITY_IPHONE
            asset_port = Convert.ToInt32(convertXML.GetElementsByTagName("asset_ios_port").Item(0).InnerText);
            asset_path = "http://";
#elif UNITY_ANDROID
            asset_port = Convert.ToInt32(convertXML.GetElementsByTagName("asset_android_port").Item(0).InnerText);
            asset_path = "http://";
#else
            asset_port = Convert.ToInt32(convertXML.GetElementsByTagName("asset_android_port").Item(0).InnerText);
            asset_path = "http://";
#endif
            ioc_version = Convert.ToInt32(convertXML.GetElementsByTagName("ioc_version").Item(0).InnerText);
            data_version = Convert.ToInt32(convertXML.GetElementsByTagName("data_version").Item(0).InnerText);
            resources_version = Convert.ToInt32(convertXML.GetElementsByTagName("resources_version").Item(0).InnerText);
            language = Convert.ToString(convertXML.GetElementsByTagName("language").Item(0).InnerText);

            asset_path += asset_ip + ":" + asset_port + "/" + SAAppConfig.GameName + "/";
            if (!Directory.Exists(Path.Combine(SAAppConfig.RemotePath, SAAppConfig.versionXML)))
            {
                PlayerPrefs.DeleteKey("ioc_version");
                PlayerPrefs.DeleteKey("data_version");
                PlayerPrefs.DeleteKey("resources_version");
                PlayerPrefs.DeleteKey("language");
            }
            if (SALang.MakDirValid(SAAppConfig.RemotePath))
            {
                SALang.writeLocalByteWithName(System.Text.Encoding.UTF8.GetBytes(www.text), SAAppConfig.versionXML);
            }
            else
            {
                SAUtils.Log("写入路径创建错误");
            }
            SAUtils.Log("版本信息加载结束");
        }
    }
}
