using UnityEngine;
using System.Collections;
using System.IO;
using System.Collections.Generic;
using System.Xml;
using System;

using XLua;

namespace Sacu.Utils
{
    public class SALang
    {
        private const byte XOR_CHAR = 0x7f;

        public static void DelFileAndMeta(string fileName)
        {
            ForceDeleteFile(fileName);
            ForceDeleteFile(fileName + ".meta");
        }
        public static string NormalizePath(string path)
        {
            path = path.Replace('\\', '/');
            path = path.Replace("//", "/");
            return path;
        }
        public static byte[] StringToBuff(string str, int encrypt)
        {
            byte[] buff = new byte[str.Length];
            for (int i = 0; i < str.Length; ++i)
            {
                buff[i] = (byte)str[i];
            }
            XorBuff(ref buff, encrypt);
            return buff;
        }
        public static void ForceDeleteFile(string filename)
        {
            if (File.Exists(filename))
            {
                FileInfo fi = new FileInfo(filename);
                fi.Attributes = FileAttributes.Normal;

                File.Delete(filename);
            }
        }

        static private string[] _GetFileList(string Path, string SearchPattern, bool SearchChild)
        {
            //判断文件夹是否存在
            if (Directory.Exists(Path) == false)
            {
                return null;
            }

            if (SearchChild)
            {
                //搜索子目录
                return Directory.GetFiles(Path, SearchPattern, SearchOption.AllDirectories);
            }
            else
            {
                //不搜索子目录
                return Directory.GetFiles(Path, SearchPattern, SearchOption.TopDirectoryOnly);
            }
        }

        static public string[] GetFileList(string Path, string SearchPattern, bool SearchChild)
        {
            //判断文件夹是否存在
            if (Directory.Exists(Path) == false)
            {
                return null;
            }

            //如果发现有*.*, 等同于搜索全部
            string[] patterns = SearchPattern.Split(';');
            foreach (string pattern in patterns)
            {
                if (pattern == "*.*")
                {
                    return _GetFileList(Path, pattern, SearchChild);
                }
            }

            //防止重复加入
            HashSet<string> fileTable = new HashSet<string>();
            foreach (string pattern in patterns)
            {
                string[] files = _GetFileList(Path, pattern, SearchChild);
                if (files != null && files.Length > 0)
                {
                    foreach (string filename in files)
                    {
                        fileTable.Add(filename);
                    }
                }
            }

            string[] result = new string[fileTable.Count];
            int index = 0;
            foreach (string filename in fileTable)
            {
                result[index++] = filename;
            }
            return result;
        }
        public static void XorBuff(ref byte[] buff, int encrypt)
        {
            if (encrypt == 0)
            {
                return;
            }

            for (int i = 0; i < buff.Length; ++i)
            {
                buff[i] = (byte)(buff[i] ^ XOR_CHAR);
            }
        }
		
		public static string BuffToString(byte[] buff, int encrypt)
		{
			XorBuff(ref buff, encrypt);
			return System.Text.Encoding.Default.GetString(buff);
		}
        static public bool MakDirValid(string dir)
        {
            if (string.IsNullOrEmpty(dir))
            {
                SAUtils.LogError("MakeDirValidFail1, Empty");
                return false;
            }

            if (Directory.Exists(dir))
            {
                return true;
            }

            try
            {
                Directory.CreateDirectory(dir);
            }
            catch (System.Exception e)
            {
                SAUtils.LogError("MakeDirValidFail2: {0}, {1}", dir, e.ToString());
                return false;
            }

            return true;
        }

        public static string GetResourcePackageName(string path)
        {
            // 所有的资源应该都置放于resources目录中
            int idx = path.IndexOf("/resources/");
            if (idx == -1)
            {
                return string.Empty;
            }

            idx = idx + "/resources/".Length;
            path = path.Substring(idx);

            string ext = Path.GetExtension(path);
            path = path.Replace(ext, "");
            return path;
        }

        public static void ForceDeleteFiles(string pathname, string filename)
        {
            DirectoryInfo dirInfo = new DirectoryInfo(pathname);
            if (null == dirInfo || !dirInfo.Exists)
            {
                return;
            }

            foreach (FileInfo newInfo in dirInfo.GetFiles(filename))
            {
                ForceDeleteFile(newInfo.FullName);
            }
        }
        public static void DeleteFileByDirectory(string pathname)
        {
            DirectoryInfo dirInfo = new DirectoryInfo(pathname);
            if (null == dirInfo || !dirInfo.Exists)
            {
                return;
            }

            foreach (DirectoryInfo newInfo in dirInfo.GetDirectories())
            {
                DeleteFileByDirectory(newInfo.FullName);
            }

            foreach (FileInfo newInfo in dirInfo.GetFiles())
            {
                ForceDeleteFile(newInfo.FullName);
            }

            dirInfo.Attributes = FileAttributes.Normal;
            dirInfo.Delete();
        }
        /// <summary>
        /// 清空指定的文件夹，但不删除文件夹
        /// </summary>
        /// <param name="dir"></param>
        public static void DeleteFolder(string dir)
        {
            if (!File.Exists(dir))
            {
                return;
            }
            foreach (string d in Directory.GetFileSystemEntries(dir))
            {
                if (File.Exists(d))
                {
                    FileInfo fi = new FileInfo(d);
                    if (fi.Attributes.ToString().IndexOf("ReadOnly") != -1)
                        fi.Attributes = FileAttributes.Normal;
                    File.Delete(d);//直接删除其中的文件  
                }
                else
                {
                    DirectoryInfo d1 = new DirectoryInfo(d);
                    if (d1.GetFiles().Length != 0)
                    {
                        DeleteFolder(d1.FullName);////递归删除子文件夹
                    }
                    Directory.Delete(d);
                }
            }
        }
        public static void ClearReadOnlyByDirectory(string pathname)
        {
            DirectoryInfo dirInfo = new DirectoryInfo(pathname);
            if (null == dirInfo || !dirInfo.Exists)
            {
                return;
            }

            dirInfo.Attributes = FileAttributes.Normal;

            foreach (FileInfo newInfo in dirInfo.GetFiles())
            {
                newInfo.Attributes = FileAttributes.Normal;
            }

            foreach (DirectoryInfo newInfo in dirInfo.GetDirectories())
            {
                ClearReadOnlyByDirectory(newInfo.FullName);
            }
        }
        /// <summary>
        /// 通过名称写入本地文件
        /// </summary>
        /// <param name="fileStream"></param>
        /// <param name="fileName"></param>
        public static void writeLocalByteWithName(byte[] fileStream, string fileName)
        {
            fileName = Path.Combine(SAAppConfig.RemotePath, fileName);
            MakDirValid(fileName.Substring(0, fileName.LastIndexOf('/')));
            FileStream fs = new FileStream(fileName, FileMode.Create, FileAccess.Write);
            fs.Write(fileStream, 0, fileStream.Length);
            fs.Flush();
            fs.Close();
        }
        /// <summary>
        /// bytes转换XML
        /// </summary>
        /// <param name="fileStream"></param>
        /// <returns></returns>
        public static XmlDocument byteConvertXML(byte[] fileStream)
        {
            MemoryStream memoryStream = new MemoryStream(fileStream);
            XmlReader xmlreader = new XmlTextReader(memoryStream);
            XmlDocument temp = new XmlDocument();
            temp.Load(xmlreader);

            return temp;
        }

        public static XmlDocument stringConvertXML(string str)
        {
            XmlDocument temp = new XmlDocument();
            temp.LoadXml(str);
            return temp;
        }
        /// <summary>
        /// 通过名称读取本地文件，返回bytes
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        public static byte[] readLocalByteWithName(string fileName)
        {
            byte[] temp = null;
            string path = Path.Combine(SAAppConfig.RemotePath, fileName);//版本文件本地路径
            if (File.Exists(path))
            {
                FileStream fs = new FileStream(path, FileMode.Open, FileAccess.Read);
                temp = new byte[fs.Length];
                fs.Read(temp, 0, Convert.ToInt32(fs.Length));
                fs.Flush();
                fs.Close();
            }
            return temp;
        }
        /// <summary>
        /// 通过名称读取本地文件，返回XML
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        public static XmlDocument getLocalXMLWithName(string fileName)
        {
            byte[] tempBytes = readLocalByteWithName(fileName);
            XmlDocument temp;
            if (tempBytes != null)
            {
                temp = byteConvertXML(tempBytes);
            }
            else
            {
                temp = new XmlDocument();
                temp.LoadXml("<Files></Files>");
            }
            return temp;
        }


        /// <summary>
        /// 清理内存
        /// </summary>
        public static void ClearMemory()
        {
            GC.Collect();
            Resources.UnloadUnusedAssets();
        }

        /// <summary>
        /// 取得Lua路径
        /// </summary>
        public static string LuaPath(string name)
        {
            string lowerName = name.ToLower();
            if (lowerName.EndsWith(".lua"))
            {
                int index = name.LastIndexOf('.');
                name = name.Substring(0, index);
            }
            name = name.Replace('.', '/');
            //return path + "/uLua/lua/" + name + ".lua";
            if (SAAppConfig.LuaRelease)
            {
                name = SAAppConfig.RemotePath + SAAppConfig.LuaDir + name + ".lua";
            }
            else
            {
                name = SAAppConfig.DevLuaDir + name + ".lua";
            }
            return name;
        }

        public static void addListenerButtonClick(GameObject button, LuaFunction luafunc)
        {
            if (button == null) return;
            UIEventListener.Get(button).onClick = delegate(GameObject o)
            {
                luafunc.Call(button);
            };
        }
        public static void removeListenerButtonClick(GameObject button)
        {
            UIEventListener.Get(button).onClick = null;
        }
        
        public static void SetMaterialTiling(GameObject go, string TexName, Vector2 tiling)
        {
            Material m = go.GetComponent<Renderer>().material;
            m.SetTextureScale(TexName, tiling);
        }
        public static void SetMaterialOffset(GameObject go, string TexName, Vector2 offset)
        {
            Material m = go.GetComponent<Renderer>().material;
            m.SetTextureOffset(TexName, offset);
        }
        public static void SetMaterialVector(GameObject go, string TexName, Vector4 vector)
        {
            Material m = go.GetComponent<Renderer>().material;
            m.SetVector(TexName, vector);
        }
    }
}
