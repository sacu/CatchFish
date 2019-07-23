using UnityEngine;
using System.Collections;
using System.IO;

namespace Sacu.Utils
{
    public class SAAppConfig
    {
        public static string GameName = "jiira";
        public static string Platform =
#if UNITY_ANDROID
"Android";
#elif UNITY_IPHONE
 "IOS";
#elif UNITY_STANDALONE_WIN || UNITY_EDITOR
 "Windows32";
#else
 string.Empty;
#endif
        /// <summary>
        /// 实际设备发布资源加载目录
        /// </summary>
        private static string remotePath = 
                #if UNITY_ANDROID
                    Application.persistentDataPath + "/";// ReleaseMode ? "jar:file://" + Application.dataPath + "!/assets/": Application.persistentDataPath;
                #elif UNITY_IPHONE
	                //Application.temporaryCachePath + "/";
	                Application.persistentDataPath + "/";
	                //Application.dataPath + "/Raw/";
                #elif UNITY_STANDALONE_WIN || UNITY_EDITOR
	                Application.dataPath + "/StreamingAssets/";
                #else
                    string.Empty;
                #endif
        public static string RemotePath
        {
            get
            {
                return remotePath;
            }
        }

        private static int languageType = 2;
        private static string _Language;
        public static string Language
        {
            get
            {
                if (null == _Language)
                {
                    switch (languageType)
                    {
                        case 1:
                            {
                                _Language = "en";//英语
                                break;
                            }
                        case 2:
                            {
                                _Language = "cn";//汉语
                                break;
                            }
                        case 3:
                            {
                                _Language = "jp";//日语
                                break;
                            }
                        case 4:
                            {
                                _Language = "ko";//韩语
                                break;
                            }
                        default:
                            {
                                _Language = "en";
                                break;
                            }
                    }
                }
                return _Language;
            }
        }

        public static string LanguagePlatform
        {
            get
            {
                return Language + Platform;
            }
        }

        //############################## 发布资源目标目录 Release
        public static string ReleasePath = Path.Combine(Application.dataPath, "Assetbundle");
		public static string LocalReleasePath = "Assets/Assetbundle/";
        //字体
        public static string PrefabFontAtlasPath = "FontAtlas/";
        //图集
        public static string PrefabAtlasPath = "Atlas/";
        //图片
        public static string ImagePath = "Image/";
        //图标
        //public static string UIIconPath = "DirUI/Icon/";
        //图表图集
        //public static string UIIconAtlasPath = "DirUI/IconAtlas/";
        //预置
        public static string PrefabUIPath = "DirUI/";
        //Lua
		public static string LuaPathName = Language + "_lua.bytes";
        //############################### 发布资源获得路径(开发目录)Resources
		public static string DevDir = 
#if UNITY_STANDALONE_OSX
		"file://" +
#elif UNITY_STANDALONE_WIN
		"file:///" +
#else
		"" +
#endif
		Application.dataPath.Substring(0, Application.dataPath.Length - "Assets".Length);
        public static string LocalDevDir = "Assets/_Resources/";
        //res dir
		public static string DevResDir = Path.Combine(DevDir, LocalDevDir);

        /// <summary>
        /// 打包目录
        /// </summary>
        //数据表
        public const string DataDir = "Data/";
        //图片
        public static string TextureDir = "Texture/";
        //材质
        public static string MaterialDir = "Material/";
        //字体
        public static string PrefabFontAtlasDir = "Font/";
        //图集
        public static string PrefabAtlasDir = "Atlas/";
        //模型预置
        public const string ModelDir = "Model/";
        //模型预置
        public const string FBXDir = "FBX/";
        //UI预置
        public static string PrefabUIDir = "UI/";
		//Lua
		public static string LuaByteDir = "Lua/";
        //Shader
        public static string ShaderDir = "Shader/";
        //粒子
        public static string ParticleDir = "Particle/";
        //音效
        public static string SoundDir = "Sound/";

        //Lua文件目录
        public static string LuaDir = "LuaScr/";
		public static string TempLuaDir = "DirLuaTemp/";
        public static string iocXML = Language + "_ioc.xml";
        public static string versionXML = Language + "_version.xml";
        public static string dataTable = Language + "_saproto.u";
        public static string DevLuaDir = Application.dataPath + "/" + LuaDir;
        public static string LuaBasePath = Application.dataPath + "/uLua/Source/";

        public static string RemoteLuaDir = RemotePath + LuaDir;

        public const bool UsePbc = true;                           //PBC
        public const bool UseLpeg = true;                          //LPEG
        public const bool UsePbLua = true;                         //Protobuff-lua-gen
        public const bool UseCJson = true;                         //CJson
        public const bool UseSproto = true;                        //Sproto
        public const bool AutoWrapMode = true;                     //自动Wrap模式 
        //#################################################
        /// <summary>
        ///远程资源目录
        /// </summary>
        //public static string AssetRemoteIP = "http://127.0.0.1/";
        //public static string AssetRemoteIP = "http://10.0.0.10/";
        //public static string AssetRemoteIP = "http://123.57.157.154/";

        public static string VersionPath = "http://127.0.0.1/" + GameName + "/" + LanguagePlatform + "/";

        public static bool IsPlatForm = false;//是否启用平台登陆
        public static bool IsLog = true;
        public static bool Thread = true;
        public static bool CacheModel = false;//是否是缓存模式

        /// <summary>
        /// 开发时以下设置false 全部本地调用
        /// </summary>
        public static bool ConfigRelease = false;//置文件是否使用发布
        public static bool UIRelease = false;//UI是否使用发布
        public static bool LuaRelease = false;//lua文件是否使用发布
    }
}