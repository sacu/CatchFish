using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using org.jiira.protobuf;
using Sacu.Collection;
using System.Text;
using System.IO;
using System;

namespace Sacu.Utils
{
    public class SADataTable
    {

        public string iostring;

        private static SADataTable instance;
        public static SADataTable Instance
        {
            get
            {
                if (null == instance)
                {
                    instance = new SADataTable();
                }
                return instance;
            }
        }
        public IEnumerator loadDataTable()
        {
            if (!PlayerPrefs.HasKey("data_version") || PlayerPrefs.GetInt("data_version") != SAGameVersion.Instance.data_version)
            {
                string random = DateTime.Now.ToString("yyyymmddhhmmss");
                string versionFile = (SAAppConfig.ConfigRelease ? SAAppConfig.VersionPath : "file:///" + SAAppConfig.DevResDir + SAAppConfig.DataDir) + SAAppConfig.dataTable + "?rd=" + random;
                WWW www = new WWW(versionFile);
                SAUtils.Log(versionFile);
                yield return www;
                if (www.error != null)
                {
                    SAUtils.LogError("找不到:" + www.url);
                    SAUtils.LogError("error : " + www.error);
                    yield break;
                }
                iostring = www.text;
                SAUtils.Log("本地写入：" + SAAppConfig.RemotePath);
                if (SALang.MakDirValid(SAAppConfig.RemotePath))
                {
                    SALang.writeLocalByteWithName(System.Text.Encoding.UTF8.GetBytes(iostring), SAAppConfig.dataTable);
                    PlayerPrefs.SetInt("data_version", SAGameVersion.Instance.data_version);
                } else
                {
                    SAUtils.Log("写入路径创建错误");
                }
            }
            else
            {
                iostring = System.Text.Encoding.UTF8.GetString(SALang.readLocalByteWithName(SAAppConfig.dataTable));
            }
            SAProtoDecode.parsing(iostring);
            SAUtils.Log("数据表加载结束");

        }
    }
}
   
