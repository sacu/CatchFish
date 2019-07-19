using UnityEngine;
using System.Collections;

namespace Utils
{
    public class AssetBundleQueue
    {
        //public string remotePath;
        //public string localPath;
        public string key;
        public Object target;
        public string type;
        public string version;
        public bool createAssetBundle;
        //下载地址(名称),存储地址(名称),接收目标

        //string remotePath, string localPath
        public AssetBundleQueue(string key, Object target, string type, string version)
        {
            //this.remotePath = remotePath;
            //this.localPath = localPath;
            this.key = key;
            this.target = target;
            this.type = type;
            this.version = version;
        }
    }

}

