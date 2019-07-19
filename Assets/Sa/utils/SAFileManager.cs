using UnityEngine;
using System.Collections.Generic;
using System.IO;

namespace Sacu.Utils
{
    public class SAFileManager
    {
        private Dictionary<string, SALuaFileManager> luaManagers = new Dictionary<string, SALuaFileManager>();
        private static SAFileManager instance;
        public static SAFileManager Instance
        {
            get
            {
                if (null == instance)
                {
                    instance = new SAFileManager();
                }
                return instance;
            }
        }

        public string ReadStreamingAssetText(string filename)
        {
            bool readLocalFile = !SAAppConfig.LuaRelease;
#if USE_LOCAL_STREAM_DATA
        readLocalFile = true;
#endif
            if (readLocalFile)
            {
                return ReadDevelopData(filename);
            }
            return ReadText(filename);
        }

        // 该函数只可能发生在开发模式下
        public string ReadDevelopData(string filename)
        {
            if (SAAppConfig.LuaRelease)
            {
                // 在设备上跑调试文件
                filename = Path.Combine(SAAppConfig.DevLuaDir, filename);
            }
            else
            {
                // 在Unity编辑器中读取文件
                filename = Path.Combine(Path.Combine(SAAppConfig.ReleasePath, SAAppConfig.LuaDir), filename);
            }

            // 使用原来的文件系统(编辑器模式下)
            if (File.Exists(filename))
            {
                return File.ReadAllText(filename, System.Text.Encoding.UTF8);
            }

            return string.Empty;
        }

        // 读取文件, 路径为相对路径, 例如: LuaScript/Boot.lua
        public byte[] ReadBytes(string filename)
        {
            string luaFileName = GetRootPackageName(filename);
            if (luaFileName.Length == 0)
            {
                Debug.LogWarning(string.Format("Read Fail, packageName={0}", luaFileName));
                return null;
            }

            SALuaFileManager luaManager;
            if (!luaManagers.TryGetValue(luaFileName, out luaManager))
            {
                Debug.LogWarning(string.Format("Read Fail, can't found package: {0}", luaFileName));
                return null;
            }

            return luaManager.ReadBytes(filename);
        }

        // 读取文件, 路径为相对路径, 例如: LuaScript/Boot.lua
        public string ReadText(string filename)
        {
            string packageName = GetRootPackageName(filename);
            if (packageName.Length == 0)
            {
                return string.Empty;
            }
            SALuaFileManager luaManager;
            if (!luaManagers.TryGetValue(packageName, out luaManager))
            {
                return string.Empty;
            }
            return luaManager.ReadText(filename);
        }

        public string GetRootPackageName(string filename)
        {
            int pos = filename.IndexOf('/');
            if (pos == -1)
            {
                return string.Empty;
            }

            return filename.Substring(0, pos);
        }
    }
}
