using UnityEngine;
using System.Collections;
using Sacu.Utils;
using Sacu.Collection;
using Sacu.Factory;
using System.Collections.Generic;

namespace Sacu.Utils
{
    public class SAManager
    {

        private static SAManager _instance;
        private SALaunch launch;
        public static SAManager Instance
        {
            get
            {
                if (null == _instance)
                {
                    _instance = new SAManager();
                }
                return _instance;
            }
        }
        protected bool _init = false;

        public int NGUILayer;
        //########### factory
        public Vector3 HideVec3;
        public Transform UIRootCamera;

        public Camera MainCamera;

        private SAManager()
        {

        }

        public void Init(SALaunch launch)
        {
            if (_init)
            {
                return;
            }
            GameObject.DontDestroyOnLoad(launch);
            GameObject.DontDestroyOnLoad(launch.gameObject);
            this.launch = launch;
            NGUILayer = LayerMask.NameToLayer("NGUI");
            GameObject uiRoot = GameObject.Find("UIRoot");
            if (null == uiRoot)
            {
                uiRoot = (GameObject)GameObject.Instantiate(Resources.Load("UIRoot"));
            }
            MainCamera = GameObject.Find("Main3DCamera").GetComponent<Camera>();
            UIRootCamera = uiRoot.transform.Find("Main2DCamera");
            HideVec3 = launch.transform.position - (launch.transform.forward * 1000);
            _init = true;
            Revert();
        }

        public void Revert()
        {
            disposeAllFactory();
            SAManager.Instance.launch.StartCoroutine(Instance.InitRemoteData());
        }
        IEnumerator InitRemoteData()
        {
            yield return launch.StartCoroutine(SAGameVersion.Instance.loadVersion());//版本信息加载
            yield return launch.StartCoroutine(SADataTable.Instance.loadDataTable());//DataTable信息加载
            yield return launch.StartCoroutine(IOCManager.Instance.loadIOC());//ioc信息加载
        }

        //##################### factory controller #################################
        public void startFactory(string factoryName)
        {
            if (IOCManager.Instance.factorys.ContainsKey(factoryName))
            {
                startFactory(factoryName, null);
            }
        }
        public void startFactory(string factoryName, System.Object args)
        {
            if (IOCManager.Instance.factorys.ContainsKey(factoryName))
            {
                IOCManager.Instance.factorys[factoryName].startFactory(args);
            }
        }
        public void disposeFactory(string factoryName)
        {
            if (IOCManager.Instance.factorys.ContainsKey(factoryName))
            {
                IOCManager.Instance.factorys[factoryName].disposeFactory();
            }
        }
        /**
         * 关闭所有工厂
         */
        public void disposeAllFactory()
        {
            Dictionary<string, SAFactory> factorys = IOCManager.Instance.factorys;
            Dictionary<string, SAFactory>.Enumerator en = factorys.GetEnumerator();
            KeyValuePair<string, SAFactory> pair;
            while (en.MoveNext())
            {
                pair = en.Current;
                SAUtils.Log("factory name : " + pair.Key);
                pair.Value.KillFactory();
            }
        }

        public SAFactory getFactory(string factoryName)
        {
            if (IOCManager.Instance.factorys.ContainsKey(factoryName))
            {
                return IOCManager.Instance.factorys[factoryName];
            }
            return null;
        }
        /**
         * 向所有工厂发送消息
         */
        public void sendMessageToAllFactory(string type, object body)
        {
            Dictionary<string, SAFactory> factorys = IOCManager.Instance.factorys;
            Dictionary<string, SAFactory>.Enumerator en = factorys.GetEnumerator();
            KeyValuePair<string, SAFactory> pair;
            while (en.MoveNext())
            {
                pair = en.Current;
                pair.Value.dispatchEvent(type, body);
            }
        }
        public void sendMessageToFactory(string factoryName, string type, object body)
        {
            getFactory(factoryName).dispatchEvent(type, body);
        }
    }
}