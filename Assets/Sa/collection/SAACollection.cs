
using UnityEngine;
namespace Sacu.Collection
{
    public class SAACollection
    {
        public const string ERROR = ".error";
        public const string CHANGE = ".change";
        public const string DESTROY = ".destroy";
        public const string COMPLETE = ".complete";
        public const string PROGRESS = ".progress";
        public const string REFRESH = ".refresh";

        public const string VERSION = ".version";

		public const string AddScore = "add.score";

        public const string CommonStr = "common";
        public const int ComminLen = 6;
        public const string UIStr = "ui";
        public const string TextureStr = "texture";
        public const string MaterialStr = "material";
        public const int MatSuffixLen = 4;
        public const string FontStr = "font";
        public const string AtlasStr = "atlas";
        public const string ParticleStr = "particle";
        public const string ModelStr = "model";
        public const string FBXStr = "fbx";
        public const string ShaderStr = "shader";
        public const string DataStr = "data";
        public const string LuaStr = "lua";
        public const string SoundStr = "sound";

        public const string GraphsStr = "Graphs.";
        public const string FactoryStr = "Factory.";
        public const string GraphSuffix = "GraphWorker";
        //socket

        //lua
        public const string luaMainStart = "MainStart";//unity 主线程入口
        public const string luaNew = "new";//工人创建
        public const string luaStart = "onStart";//工人启动
        public const string luaRegister = "onRegister";//工人注册到工厂
        public const string luaRemove = "onRemove";//工人从工厂移除
        public const string luaRegisterComplete = "onRegisterComplete";//工厂注册完毕
        public const string luaDispose = "onDispose";//工厂关闭

        //屏幕坐标转世界坐标
        public static float width;
        public static float height;
        public static float halfWidth;
        public static float halfHeight;
        public static void initScreenToWorldPoint()
        {
            Vector3 rect = new Vector3(Screen.width, Screen.height);
            rect = Camera.main.ScreenToWorldPoint(rect);
            halfWidth = rect.x;
            halfHeight = rect.y;
            width = halfWidth * 2;
            height = halfHeight * 2;
        }
    }
}