using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System;
using System.Reflection;

using Sacu.Factory;
using Sacu.Factory.Worker;
using Sacu.Utils;
namespace Sacu.Collection
{
    public class SALaunch : MonoBehaviour
    {

        ///关于加载
        ///加载分为内部加载器和外部加载器
        ///内部加载器AssetBundleLocalManager
        ///
        /// 
        /// 
        /// 
        ///外部加载器AssetBundleRemoteManager
        ///外部加载器启动时默认加载远程配置文件，并更新本地持久文件版本，游戏运行过程中，时时通过socket信息更新本地文件缓存
        ///启动该模块会自动匹配远程配置文件，没有变化的文件直接按照本地版本读入AssetBundleLocalManager，有变化的文件下载后修改本地版本，并写入本地，然后读入AssetBundleLocalManager
        ///
        // Use this for initialization
        void Start()
        {
            SAManager.Instance.Init(this);
        }
    }
}