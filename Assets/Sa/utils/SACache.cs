using UnityEngine;
namespace Sacu.Utils
{
	using System.IO;
    using System.Collections.Generic;
    using Sacu.Collection;
    using System;
    public class SACache
    {
        //ui
        private static Dictionary<string, Object> ui_res = new Dictionary<string, Object>();//启用
        //atlas
        private static Dictionary<string, Object> atlas_res = new Dictionary<string, Object>();//启用
        //模型
        private static Dictionary<string, Object> model_res = new Dictionary<string, Object>();//启用
        //动作
        private static Dictionary<string, Object> fbx_res = new Dictionary<string, Object>();//启用
        //粒子
        private static Dictionary<string, Object> particle_res = new Dictionary<string, Object>();
        //图形
        private static Dictionary<string, Object> texture_res = new Dictionary<string, Object>();
        //材质
        private static Dictionary<string, Object> material_res = new Dictionary<string, Object>();//启用
        //字体
        private static Dictionary<string, Object> font_res = new Dictionary<string, Object>();
        //shader
        private static Dictionary<string, Object> shader_res = new Dictionary<string, Object>();
        //Lua文件
        public static LuaPackage byte_res = new LuaPackage();
        // 音效
        public static Dictionary<string, Object> sound_res = new Dictionary<string, object>();
        
        public static Dictionary<string, Object> getResDictionary(string resType)
        {
            switch (resType)
            {
                case SAACollection.TextureStr:
                    {
                        //return texture_res;
                        break;
                    }
                case SAACollection.MaterialStr:
                    {
                        return material_res;
                    }
                case SAACollection.FontStr:
                    {
                        //return font_res;
                        break;
                    }
                case SAACollection.UIStr:
                    {
                        return ui_res;
                    }
                case SAACollection.AtlasStr:
                    {
                        return atlas_res;
                    }
                case SAACollection.ParticleStr:
                    {
                        return particle_res;
                    }
                case SAACollection.ModelStr:
                    {
                        return model_res;
                    }
                case SAACollection.FBXStr:
                    {
                        return fbx_res;
                    }
                case SAACollection.ShaderStr:
                    {
                        return shader_res;
                    }
                case SAACollection.SoundStr: {
                        return sound_res;
                    }
            }
            return null;
        }
        public static void LoadLuaPackage(string dir, string filename){
            
			string pathname = Path.Combine(dir, filename);
			FileStream stream = null;
			try
			{
                stream = File.OpenRead(pathname);
			} catch (Exception e)
			{
				Debug.LogError(string.Format("LuaManager, load package fail: {0}, info={1}", 
				                             pathname, e.ToString()));
				return ;
			}
			if (stream == null)
			{
				Debug.LogError(string.Format("LuaManager, load package fail: {0}", pathname));
				return ;
			}
			LuaPackage package = new LuaPackage();
			package.Load(stream);
		}
        /**
        public static UIAtlas getAtlas(string atlasName)
        {
#if UNITY_EDITOR
            if (SAAppConfig.UIRelease)//远程发布版本
                return SACache.getResWithName<UIAtlas>("atlas." + atlasName + "." + atlasName, ".prefab");
            else
                return UnityEditor.AssetDatabase.LoadAssetAtPath<UIAtlas>("Assets/_Resources/" + atlasName + "/atlasName");
#else
                return SACache.getResWithName<UIAtlas>("atlas." + atlasName + "." + atlasName, ".prefab");
#endif
        }*/

        public static T getResWithName<T>(string name, string suffix)
        {
            name = name.Replace("/", ".");
            string lowerName = name.ToLower();
            int beginPos = name.IndexOf(".");
            Dictionary<string, Object> assetCache = getResDictionary(name.Substring(0, beginPos).ToLower());
            if (!assetCache.ContainsKey(lowerName))
            {
                if (SAAppConfig.CacheModel)
                {
                    assetCache.Add(lowerName, _getResWithName(name, suffix));
                }
                else
                {
                    return (T)_getResWithName(name, suffix);
                }
                
            }
            return (T)assetCache[lowerName];
        }

        private static object _getResWithName(string name, string suffix)
        {
            if (SAAppConfig.UIRelease)
            {
                name = name.Replace("/", ".") + "." + suffix;
                int dot = name.LastIndexOf('.');
                AssetBundle ab = AssetBundle.LoadFromFile(Path.Combine(SAAppConfig.RemotePath, SAAppConfig.LanguagePlatform + "/" + name));//加载依赖文件
                name = SAAppConfig.LocalDevDir.ToLower() + name.Substring(0, dot).Replace(".", "/") + name.Substring(dot);
                object ab_obj = ab.LoadAsset(name);
                ab.Unload(false);
                return ab_obj;
            } else {
#if UNITY_EDITOR
                name = name.Replace(".", "/") + "." + suffix;
                return UnityEditor.AssetDatabase.LoadAssetAtPath<GameObject>("Assets/_Resources/" + name);
#else
                name = name.Replace("/", ".") + "." + suffix;
                int dot = name.LastIndexOf('.');
                AssetBundle ab = AssetBundle.LoadFromFile(Path.Combine(SAAppConfig.RemotePath, SAAppConfig.LanguagePlatform + "/" + name));//加载依赖文件
                name = SAAppConfig.LocalDevDir.ToLower() + name.Substring(0, dot).Replace(".", "/") + name.Substring(dot);
                object ab_obj = ab.LoadAsset(name);
                ab.Unload(false);
                return ab_obj;          
#endif
            }
        }

        public static GameObject getFBXWithName(string name)
        {
            Object o = getObjectWithName(name, "fbx");
            return (GameObject)o;
        }
        public static Object getObjectWithName(string name)
        {
            return getObjectWithName(name, "prefab");
        }
        public static Object getObjectWithName(string name, string suffix) {
            int path;
            if (name.IndexOf('/') == -1)
            {
                path = name.LastIndexOf(".") + 1;
            } else
            {
                path = name.LastIndexOf("/") + 1;
            }
            string str = name.Substring(0, path) + SAAppConfig.Language + "_" + name.Substring(path);
            return getResWithName<Object>(str, suffix);
        }

        // 获得材质球 _candy
        public static Object geMaterialWithLanguageName(string name) {
            string path = "Assets/_Resources/Material/" + SAAppConfig.Language + "_" + name + ".mat";

#if UNITY_EDITOR
            Material mat = UnityEditor.AssetDatabase.LoadAssetAtPath<Material>(path);
            
            return (Object)mat;
#else
            //string name_ = path.Replace("/", ".");
            string name_ = path;
            Sacu.Utils.SAUtils.Console("replace path: " + name_);
            int dot = name_.LastIndexOf('.');
            string ab_path = Path.Combine(SAAppConfig.RemotePath, SAAppConfig.LanguagePlatform + "/" + name_);
            Sacu.Utils.SAUtils.Console("ab_path path: " + ab_path);
            AssetBundle ab = AssetBundle.LoadFromFile(ab_path);//加载依赖文件
            name_ = SAAppConfig.LocalDevDir.ToLower() + name_.Substring(0, dot).Replace(".", "/") + name_.Substring(dot);
            object ab_obj = ab.LoadAsset(name_);
            ab.Unload(false);
            return ab_obj;           
#endif

        }

        public static void Clear()
        {
            ui_res.Clear();
            atlas_res.Clear();
            model_res.Clear();
            particle_res.Clear();
            texture_res.Clear();
            material_res.Clear();
            font_res.Clear();
            shader_res.Clear();
            sound_res.Clear();
        }
    }
   
	public struct LuaNode{
		public LuaNode(long _offset, long _size)
		{
			offset = _offset;
			size = _size;
		}
		public long offset;
		public long size;
	}
	public class LuaPackage
	{
		private Dictionary<string, LuaNode> nodes;
		private FileStream fileStream;
		private int encrypt = 0;

		public LuaPackage(){
			nodes = new Dictionary<string, LuaNode>();
		}
		public void EditorUnpackToDirectory(string dir)
		{
			foreach (var kv in nodes)
			{
				string filename = kv.Key;
				
				string pathname = Path.Combine(dir, filename);
				SALang.MakDirValid( Path.GetDirectoryName(pathname) );
				
				byte[] bytes = ReadBytes(filename);
				File.WriteAllBytes(pathname, bytes);
			}
		}
		
		public string ReadText(string filename)
		{
			byte[] buff = ReadBytes(filename);
			if (buff != null)
			{

				return System.Text.Encoding.UTF8.GetString(buff);
			}
			return string.Empty;
		}
		
		public byte[] ReadBytes(string filename)
		{
			LuaNode node;
			if (nodes.TryGetValue(filename, out node))
			{
				byte[] buff = new byte[node.size];
				fileStream.Seek(node.offset, SeekOrigin.Begin);
				fileStream.Read(buff, 0, (int)node.size);
				SALang.XorBuff(ref buff, encrypt);
				return buff;
			}
			
			Debug.LogWarning(string.Format("LuaPackage ReadBytes fail, filename={0}", filename));
			
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
			for (int i=0; i<count; ++i)
			{
				int buffLen = reader.ReadInt32();
				byte[] buff = reader.ReadBytes(buffLen);
				string filename = SALang.BuffToString(buff, encrypt);
				
				int size = reader.ReadInt32();
				int offset = (int)fileStream.Position;
				fileStream.Seek(size, SeekOrigin.Current);
				
				LuaNode node = new LuaNode(offset, size);
				nodes.Add(filename, node);
                SALang.writeLocalByteWithName(ReadBytes(filename), filename);
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