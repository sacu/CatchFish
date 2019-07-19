using System.Collections.Generic;
using System;
using UnityEngine;

using Sacu.Events;
using Sacu.Factory.Worker;
using Sacu.Collection;
using Sacu.Utils;

namespace Sacu.Factory
{
    public class SAFactory : SABaseFactory
    {
        public bool IsStart
        {
            get
            {
                return _start;
            }
        }
        private Dictionary<string, SAIOCWorker> workersIOC;
        /**
         * 构造函数。
         * @param Name 工厂名称。
         */
        public SAFactory(string name):base(name)
        {
            workersIOC = new Dictionary<string, SAIOCWorker>();
        }
        public void addWorker(SAIOCWorker worker)
        {
            workersIOC.Add(worker.name, worker);
        }

        public void joinData(IOCDataWorker workerData)
        {
            string DotName = workerData.name.Replace("/", ".");
            SADataWorker data = IOCManager.Instance.getIOCDataWorker(DotName);
            if (data == null)
            {
                Type dataType = Type.GetType(DotName);
                if (null == dataType)
                {
                    string graphName = DotName.Substring(DotName.LastIndexOf(".") + 1);
                    dataType = Type.GetType(SAACollection.GraphsStr + graphName + SAACollection.GraphSuffix);
                }
                if (null == dataType)
                {
                    data = new SADataWorker(workerData.name, workerData.command);
                }
                else
                {
                    data = (SADataWorker)dataType.GetConstructor(new Type[] { typeof(string), typeof(string) }).Invoke(new System.Object[] { workerData.name, workerData.command });//构造;
                }
                IOCManager.Instance.addSADataWorker(DotName, data);
            }
            dataWorkers.Add(data);
            if (_start)
            {
                registerDataWorker(data);
            }
        }
        virtual public void joinGraph(IOCGraphWorker workerData)
        {
            GameObject display;
            SAGraphWorker graph;
            
            string DotName = workerData.name.Replace("/", ".");
            string NoDotName = workerData.name.Replace(".", "/");
            if (repeatObjects.ContainsKey(DotName))
            {
                display = repeatObjects[DotName];
            }
            else
            {
                string prefabName;
                int languageDot = DotName.LastIndexOf(".") + 1;
                if (workerData.isLocal)//强制本地
                {
                    prefabName = NoDotName.Substring(0, languageDot) + SAAppConfig.Language + "_" + NoDotName.Substring(languageDot);
                    display = (GameObject)UnityEngine.Object.Instantiate(Resources.Load(prefabName));
                }
                else
                {
                    prefabName = DotName.Substring(0, languageDot) + SAAppConfig.Language + "_" + DotName.Substring(languageDot);
                    display = (GameObject)UnityEngine.Object.Instantiate(SACache.getResWithName<GameObject>(prefabName, "prefab"));
                }
                //repeatObjects.Add(DotName, display);//关闭缓存
            }
            //笔记
            Transform _SATransform = display.transform;
            GameObject _SAGameObject = display;
            //shell
            GameObject shell = new GameObject();
            shell.name = _SAGameObject.name + "[SHELL]";
            shell.layer = display.layer;
            display.transform.SetParent(shell.transform);
            display = shell;

            if (null != SAManager.Instance.UIRootCamera && display.layer == SAManager.Instance.NGUILayer)
            {
                display.transform.SetParent(SAManager.Instance.UIRootCamera.transform, false);
            }
            Type graphType = Type.GetType(DotName);
            if (null == graphType)
            {
                string graphName = DotName.Substring(DotName.LastIndexOf(".") + 1);
                graphType = Type.GetType(SAACollection.GraphsStr + graphName + SAACollection.GraphSuffix);
            }
            if (null == graphType)
            {
                graph = display.AddComponent<SAGraphWorker>();
            }
            else
            {
                graph = (SAGraphWorker)display.AddComponent(graphType);
            }
            graph.setOrigin(_SAGameObject, _SATransform);
            graph.setActiveDispose(workerData.isActiveDispose);
            graph.setDefaultStart(workerData.defaultStart);

            graph._init(DotName, NoDotName);
            graphWorkers.Add(graph);
            if (_start)
            {
                registerGraphicsWorker(graph);
            }
        }

        override public void KillFactory()//放假工厂因子
        {
            base.KillFactory();
        }
        /**
         * 初始化工厂。
         */
        override protected void onInitFactory()
        {//初始工厂因子
            base.onInitFactory();
            Dictionary<string, SAIOCWorker>.Enumerator en = workersIOC.GetEnumerator();
            while (en.MoveNext())
            {
                if (en.Current.Value.type == IOCType.GRAPH_WORKER)
                {
                    joinGraph(en.Current.Value as IOCGraphWorker);
                }
                else
                {
                    joinData(en.Current.Value as IOCDataWorker);
                }
            }
        }
        
    }
}