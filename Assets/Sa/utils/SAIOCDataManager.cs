using UnityEngine;
using System.Collections.Generic;
using System;
using System.Xml;
using System.Collections;
using Sacu.Factory;
using Sacu.Factory.Worker;
using Sacu.Collection;

namespace Sacu.Utils
{
    public enum IOCType
    {
        GRAPH_WORKER,
        DATA_WORKER,
    }
    public class SAIOCWorker
    {
        public IOCType type;
        public string name;
        public SAIOCWorker()
        {
        }
    }
    public class IOCDataWorker : SAIOCWorker
    {
        public string command;
        public IOCDataWorker()
        {
        }
    }
    public class IOCGraphWorker : SAIOCWorker
    {
        public bool isLocal;
        public bool isActiveDispose;
        public bool defaultStart;
        public IOCGraphWorker()
        {
        }
    }

    public class IOCManager
    {
        private static IOCManager instance;
        public static IOCManager Instance
        {
            get
            {
                if (null == instance)
                {
                    instance = new IOCManager();
                }
                return instance;
            }
        }

        public Dictionary<string, SAFactory> factorys;
        public Dictionary<string, SADataWorker> datas;
        
        public IOCManager()
        {
            factorys = new Dictionary<string, SAFactory>();
            datas = new Dictionary<string, SADataWorker>();
        }
        public void removeFactory(string name)
        {
            if (factorys.ContainsKey(name))
            {
                factorys.Remove(name);
            }
        }
        public SADataWorker getIOCDataWorker(string name)
        {
            if (datas.ContainsKey(name))
            {
                return datas[name];
            }
            return null;
        }
        public void addSADataWorker(string name, SADataWorker data)
        {
            if (!datas.ContainsKey(name))
            {
                datas.Add(name, data);
            }
        }
        public IEnumerator loadIOC()
        {
            string xmlText;
            if (!PlayerPrefs.HasKey("ioc_version") || PlayerPrefs.GetInt("ioc_version") != SAGameVersion.Instance.ioc_version)
            {
                string random = DateTime.Now.ToString("yyyymmddhhmmss");
                string versionFile = (SAAppConfig.ConfigRelease ? SAAppConfig.VersionPath : "file:///" + SAAppConfig.DevResDir + SAAppConfig.DataDir) + SAAppConfig.iocXML + "?rd=" + random;
                WWW www = new WWW(versionFile);
                SAUtils.Log(versionFile);
                yield return www;
                if (www.error != null)
                {
                    SAUtils.LogError("error : " + www.error);
                    yield break;
                }
                xmlText = www.text;
                SALang.MakDirValid(SAAppConfig.RemotePath);
                SALang.writeLocalByteWithName(System.Text.Encoding.Default.GetBytes(xmlText), SAAppConfig.iocXML);
                PlayerPrefs.SetInt("ioc_version", SAGameVersion.Instance.ioc_version);
            } else
            {
                xmlText = System.Text.Encoding.Default.GetString(SALang.readLocalByteWithName(SAAppConfig.iocXML));
            }
            factorys.Clear();
            datas.Clear();
            List<string> defaultStart = new List<string>();
            XmlDocument convertXML = SALang.stringConvertXML(xmlText);
            XmlNodeList nodeList = convertXML.DocumentElement.ChildNodes;
            XmlNode node;
            XmlNode workerNode;
            IOCDataWorker dataWorker;
            IOCGraphWorker graphWorker;
            bool isGrap;
            XmlNodeList workerList;
            SAFactory factory;
            string factoryName;
            int i, j;
            for (i = 0; i < nodeList.Count; i++)
            {
                node = nodeList[i];
                if (node.Name.Equals("factory"))
                {
                    workerList = node.ChildNodes;
                    factoryName = node.Attributes.GetNamedItem("name").Value;
                    if (node.Attributes.GetNamedItem("defaultStart").Value.Equals("true"))
                    {
                        defaultStart.Add(factoryName);
                    }
                    Type factoryType = Type.GetType(SAACollection.FactoryStr + factoryName);
                    if (null == factoryType)
                    {
                        factory = new SAFactory(factoryName);
                    }
                    else
                    {
                        factory = (SAFactory)factoryType.GetConstructor(new Type[] { typeof(string) }).Invoke(new System.Object[] { factoryName });//构造;
                    }
                    factorys.Add(factoryName, factory);
                    for (j = 0; j < workerList.Count; j++)
                    {
                        workerNode = workerList[j];
                        if (workerNode.Name.Equals("worker"))
                        {
                            isGrap = workerNode.Attributes.GetNamedItem("type").Value.Equals("graph");// ? IOCType.GRAPH_WORKER : IOCType.DATA_WORKER;
                            if (isGrap)
                            {
                                graphWorker = new IOCGraphWorker();
                                graphWorker.name = workerNode.Attributes.GetNamedItem("name").Value;
                                graphWorker.isLocal = workerNode.Attributes.GetNamedItem("isLocal").Value.Equals("true");
                                graphWorker.defaultStart = workerNode.Attributes.GetNamedItem("defaultStart").Value.Equals("true");
                                graphWorker.type = IOCType.GRAPH_WORKER;
                                graphWorker.isActiveDispose = workerNode.Attributes.GetNamedItem("isActiveDispose").Value.Equals("true");
                                factory.addWorker(graphWorker);
                            }
                            else
                            {
                                dataWorker = new IOCDataWorker();
                                dataWorker.type = IOCType.DATA_WORKER;
                                dataWorker.name = workerNode.Attributes.GetNamedItem("name").Value;
                                dataWorker.command = workerNode.Attributes.GetNamedItem("command").Value;
                                factory.addWorker(dataWorker);
                            }
                        }
                    }
                }
            }
            for (i = 0; i < defaultStart.Count; ++i)
            {
                if (factorys.ContainsKey(defaultStart[i]))
                {
                    factorys[defaultStart[i]].startFactory(null);
                }
            }
            yield return null;
        }
    }
}
