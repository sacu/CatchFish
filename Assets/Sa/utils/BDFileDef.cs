using System;
using System.IO;
using UnityEngine;
using System.Collections.Generic;
//using Mono.Xml;

namespace Sacu.Utils
{
    public class BDFileInfo
    {
        public const int TYPE_STREAM = 1;
        public const int TYPE_ASSETBUNDLE = 2;
        public const int TYPE_SCENES = 3;

        public BDFileInfo(int fileType, string internalAssetPath)
        {
            this.fileType = fileType;
            this.internalAssetPath = internalAssetPath;
            this.documentPathname = string.Format("{0}.bytes", internalAssetPath);
        }

        // 内部资源路径
        public string internalAssetPath;
        // 释放的文档路径
        public string documentPathname;
        // 文档类型
        public int fileType;
    }

    public static class BDFileDef
    {
        public const int SPLIT_MAPS = 3;

        private static void AddFile(ref List<BDFileInfo> files, int fileType, string assetPath, int splitSize = 0)
        {
            if (splitSize > 0)
            {
                for (int i = 0; i < splitSize; ++i)
                {
                    string splitAssetPath = string.Format("{0}{1}", assetPath, i);
                    files.Add(new BDFileInfo(fileType, splitAssetPath));
                }
            }
            else
            {
                files.Add(new BDFileInfo(fileType, assetPath));
            }
        }

        public static List<BDFileInfo> files
        {
            get
            {
                List<BDFileInfo> fs = new List<BDFileInfo>();
                AddFile(ref fs, BDFileInfo.TYPE_STREAM, "BinaryData/Stream/LuaScript");
                AddFile(ref fs, BDFileInfo.TYPE_STREAM, "BinaryData/Stream/SceneSource");
                AddFile(ref fs, BDFileInfo.TYPE_ASSETBUNDLE, "BinaryData/Assetbundle/UIAtlas");
                AddFile(ref fs, BDFileInfo.TYPE_ASSETBUNDLE, "BinaryData/Assetbundle/UIIcon");
                AddFile(ref fs, BDFileInfo.TYPE_ASSETBUNDLE, "BinaryData/Assetbundle/UIIconAtlas");
                AddFile(ref fs, BDFileInfo.TYPE_ASSETBUNDLE, "BinaryData/Assetbundle/UIImage");
                AddFile(ref fs, BDFileInfo.TYPE_ASSETBUNDLE, "BinaryData/Assetbundle/UIFont");
                AddFile(ref fs, BDFileInfo.TYPE_ASSETBUNDLE, "BinaryData/Assetbundle/UILayout");
                AddFile(ref fs, BDFileInfo.TYPE_SCENES, "BinaryData/Assetbundle/SceneMaps", SPLIT_MAPS);
                return fs;
            }
        }

        public static BDFileInfo[] GetFilesByType(int fileType)
        {
            List<BDFileInfo> ls = new List<BDFileInfo>();
            foreach (BDFileInfo info in files)
            {
                if (info.fileType == fileType)
                {
                    ls.Add(info);
                }
            }
            return ls.ToArray();
        }


        static public VersionData ReadVersionData(string filename)
        {
            VersionData version = new VersionData();
            string path = Path.Combine(SAAppConfig.RemotePath, filename);
            if (File.Exists(path))
            {
                version.Load(File.ReadAllText(path));
            }
            return version;
        }

        static public bool WriteVersionData(string filename, VersionData versionData)
        {
            string path = Path.Combine(SAAppConfig.RemotePath, filename);
            try
            {
                SALang.ForceDeleteFile(path);
                SALang.MakDirValid(Path.GetDirectoryName(path));
                File.WriteAllText(path, versionData.ToString());
            }
            catch (Exception e)
            {
                Debug.LogError(string.Format("WriteVersionData Fail:{0}, {1}", filename, e.ToString()));
                return false;
            }
            return true;
        }

        // 本地版本号文件
        const string localVersionFilename = "BinaryData/Config/Version.bytes";

        // 读取本地版本号
        public static VersionData ReadLocalVersionData()
        {
            return ReadVersionData(localVersionFilename);
        }

        // 写入本地版本号
        public static void WriteLocalVersionData(VersionData versionData)
        {
            WriteVersionData(localVersionFilename, versionData);
        }

        //二进制版本号文件
        const string binVersionFilename = "BinaryData/Config/Bin.bytes";

        // 读取二进制版本号
        public static VersionData ReadBinVersionData()
        {
            return ReadVersionData(binVersionFilename);
        }

        // 写入二进制版本号
        public static void WriteBinVersionData(VersionData versionData)
        {
            WriteVersionData(binVersionFilename, versionData);
        }

    }

}