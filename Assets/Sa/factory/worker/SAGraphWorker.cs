using UnityEngine;


using Sacu.Utils;

using Sacu.Collection;
using System.Collections.Generic;
using Sacu.Events;
using XLua;
using Datas;
using System.Runtime.Serialization.Formatters.Binary;
using System.IO;

namespace Sacu.Factory.Worker
{
    public class SAGraphWorker : SABaseGraphWorker
    {
        
        private LuaFunction lateUpdateFunc;
        protected LuaEnv luaEnv;

        override public void destroyDisplay()
        {
            if (null != luaEnv)
            {
                luaEnv.Dispose();
            }
            base.destroyDisplay();
        }
        override protected void init()
        {
            //这里初始化Lua
            originName = patchName.Substring(patchName.IndexOf("/") + 1);// NoDotName.Replace(SAAppConfig.PrefabUIDir, "");
            luaName = displayName.Substring(displayName.LastIndexOf(".") + 1);
            
            string localFilePath = Path.Combine(SAAppConfig.LuaRelease ? SAAppConfig.RemoteLuaDir : SAAppConfig.DevLuaDir , originName + ".lua");
            bool isExist = File.Exists(localFilePath);//判断本地文件
            if (isExist)
            {
                luaEnv = new LuaEnv();
                luaEnv.AddLoader(LuaFile);
                luaEnv.DoString("require '" + localFilePath + "'");
                callLuaFun(SAACollection.luaNew, this);
            }
            setActive(false);//初始化之后
            HideVec3 = SAManager.Instance.HideVec3;
            base.init();

        }
        protected byte[] LuaFile(ref string filepath)
        {
            //TextAsset script = Resources.Load("lua/" + filepath + ".lua") as TextAsset;
            //return script.bytes;
            return File.ReadAllBytes(filepath);
        }

        override protected void mainStart()
        {
            base.mainStart();
            callLuaFun(SAACollection.luaMainStart);
        }
        public void BindAtlas(string name)
        {
            UISprite[] sprites = SAGameObject.GetComponentsInChildren<UISprite>();
            UISprite sprite;
            for (int i = 0; i < sprites.Length; ++i)
            {
                sprite = sprites[i];
                sprite.atlas = (UIAtlas)SACache.getObjectWithName(name);
            }
        }
        virtual protected void callLuaFun(string funName, System.Object value = null)
        {
            if (null != luaEnv)
            {
                LuaFunction func = luaEnv.Global.Get<LuaFunction>(funName);
                if (null != func)//没有对应的lua类
                {
                    if (null != value)
                    {
                        func.Call(value);
                    }
                    else
                    {
                        func.Call();
                    }
                    func.Dispose();
                    func = null;
                }
            }
        }
        
        /**
        * 当该工人被任职到某个工厂时触发。
        */
        override protected void onRegister()
        {
            base.onRegister();
            callLuaFun(SAACollection.luaRegister);
        }
        /**
        * 当该工人从某个工厂被解雇时触发。
        * 从工厂释放引用
        */
        override protected void onRemove()
        {
            base.onRemove();
            callLuaFun(SAACollection.luaRemove);
        }
        override protected void onRegisterComplete()
        {
            base.onRegisterComplete();
            callLuaFun(SAACollection.luaRegisterComplete);
        }

        override protected void onSrart(System.Object args)
        {
            base.onSrart(args);
            callLuaFun(SAACollection.luaStart, args);
        }
        /// <summary>
        /// 隐藏操作
        /// </summary>
        override protected void onDispose()
        {
            callLuaFun(SAACollection.luaDispose);
            base.onDispose();
        }

        override protected void LateEvent()
        {
            base.LateEvent();
            luaValidate(lateUpdateAction.LuaType);
            luaValidate(lateUpdateAction.Type);
        }

        virtual protected void luaValidate(string type)
        {
            if (null != luaEnv && handleActions.ContainsKey(type))
            {
                string handleName = handleActions[type];
                //handleName = handleName.Replace(':', '.');
                //handleName = (handleName.IndexOf('.') > -1) ? handleName : luaName + "." + handleName;

                lateUpdateFunc = luaEnv.Global.Get<LuaFunction>(handleName);
                if (null != lateUpdateFunc)//没有对应的lua类
                {
                    lateUpdateFunc.Call(lateUpdateAction);
                    lateUpdateFunc.Dispose();
                }

            }
        }
        

        public GameObject getGameObjectForName(string objectName)
        {
            return SATransform.Find(objectName).gameObject;
        }
        public GameObject getGameObjectChild(GameObject go,string objectName)
        {
            return go.transform.Find(objectName).gameObject;
        }
        
        public UnityEngine.Component getGameObjectByTypeName(string parentName, string typeName)
        {
            string str = parentName + " ====== getGameObjectByTypeName " + typeName;
            Debug.Log(str);
            return SATransform.Find(parentName).GetComponent(typeName);
        }
        public T getComponentForGameObjectName<T>(string objectName)
        {
            return getGameObjectForName(objectName).GetComponent<T>();
        }

        public GameObject InstantiateToTransform(GameObject original)
        {
            GameObject go = Object.Instantiate<GameObject>(original);
            go.transform.SetParent(SATransform);
            return go;
            //return Object.Instantiate(original);
        }
        public void addListenerButtonClick(string buttonName, LuaFunction luafunc)
        {
            addListenerButtonClick(getGameObjectForName(buttonName), luafunc);
        }
        public void addListenerButtonClick(GameObject button, LuaFunction luafunc)
        {
            SALang.addListenerButtonClick(button, luafunc);
        }
        public void removeListenerButtonClick(string buttonName)
        {
            removeListenerButtonClick(getGameObjectForName(buttonName));
        }
        public void removeListenerButtonClick(GameObject button)
        {
            SALang.removeListenerButtonClick(button);
            
        }
        public void setAtlasName()
        {

        }
    }
}