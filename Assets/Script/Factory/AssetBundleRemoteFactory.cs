using UnityEngine;
using Sacu.Factory;
using Sacu.Collection;
using Sacu.Utils;
using Graphs;
namespace Factory
{
    public class AssetBundleRemoteFactory : SAFactory
    {
        public AssetBundleRemoteFactory(string name) : base(name)
        {
        }
        override public void joinGraph(IOCGraphWorker workerData)
        {
            GameObject display;
            AssetBundleRemoteGraphWorker graph;
            string DotName = workerData.name.Replace("/", ".");
            string NoDotName = workerData.name.Replace(".", "/");
            if (repeatObjects.ContainsKey(DotName))
            {
                display = repeatObjects[DotName];
            }
            else
            {
                display = (GameObject)UnityEngine.Object.Instantiate(Resources.Load("UI/AssetLoad/" + SAAppConfig.Language + "_AssetBundleRemote"));
                repeatObjects.Add(DotName, display);
            }

            //笔记
            Transform _SATransform = display.transform;
            GameObject _SAGameObject = display.gameObject;
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
            
            graph = display.AddComponent<AssetBundleRemoteGraphWorker>();

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
    }
}

