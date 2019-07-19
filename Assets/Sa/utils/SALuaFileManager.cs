using UnityEngine;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Sacu.Utils
{
    public class SALuaFileManager
    {
        private const byte XOR_CHAR = 0x7f;
        private Dictionary<string, SALuaFile> luaFiles = new Dictionary<string, SALuaFile>();
        private FileStream fileStream;
        private int encrypt = 0;

        public void EditorUnpackToDirectory(string dir)
        {
            foreach (var kv in luaFiles)
            {
                string filename = kv.Key;

                string pathname = Path.Combine(dir, filename);

                byte[] bytes = ReadBytes(filename);
                File.WriteAllBytes(pathname, bytes);
            }
        }

        public string ReadText(string filename)
        {
            byte[] buff = ReadBytes(filename);
            if (buff != null)
            {
                return Encoding.UTF8.GetString(buff);
            }
            return string.Empty;
        }

        public byte[] ReadBytes(string filename)
        {
            SALuaFile luaFile;
            if (luaFiles.TryGetValue(filename.ToLower(), out luaFile))
            {
                byte[] buff = new byte[luaFile.size];
                fileStream.Seek(luaFile.offset, SeekOrigin.Begin);
                fileStream.Read(buff, 0, (int)luaFile.size);
				SALang.XorBuff(ref buff, encrypt);
                return buff;
            }

            Debug.LogWarning(string.Format("VFSPackage ReadBytes fail, filename={0}", filename));

            return null;
        }

        public void Load(FileStream fs)
        {
            fileStream = fs;

            BinaryReader reader = new BinaryReader(fileStream);
            /*int version = */
            reader.ReadInt32();
            /* encrypt */
            encrypt = reader.ReadInt32();
            /* count */
            int count = reader.ReadInt32();
            for (int i = 0; i < count; ++i)
            {
                int buffLen = reader.ReadInt32();
                byte[] buff = reader.ReadBytes(buffLen);
                string filename = SALang.BuffToString(buff, encrypt);

                int size = reader.ReadInt32();
                int offset = (int)fileStream.Position;
                fileStream.Seek(size, SeekOrigin.Current);

                SALuaFile luaFile = new SALuaFile(offset, size);
                luaFiles.Add(filename.ToLower(), luaFile);
            }
        }

        public void Unload()
        {
            if (fileStream != null)
            {
                fileStream.Close();
            }
        }

    }
}
