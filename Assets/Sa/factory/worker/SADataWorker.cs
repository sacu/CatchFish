using Sacu.Collection;
using XLua;
using System.IO;
using Sacu.Utils;

namespace Sacu.Factory.Worker
{
    public class SADataWorker : SABaseDataWorker
    {
        private string luaName;
        protected string originName;
        protected LuaEnv luaEnv;
        /**
        * 构造函数
        * @param name 工人名称。
        * @param command HTTPInterface的调用命令。
        */
        public SADataWorker(string name, string command):base(name, command){
            //这里初始化Lua
            originName = name.Replace(".", "/");
            luaName = name.Substring(name.LastIndexOf(".") + 1);//待后台对接时测试修改
            string localFilePath = Path.Combine(SAAppConfig.LuaRelease ? SAAppConfig.RemoteLuaDir : SAAppConfig.DevLuaDir, originName + ".lua");
            bool isExist = File.Exists(localFilePath);//判断本地文件
            if (isExist)
            {
                luaEnv = new LuaEnv();
                luaEnv.AddLoader(LuaFile);
                luaEnv.DoString(@"require '" + originName + "'");
                callLuaFun(SAACollection.luaNew, this);
            }
            
        }
        protected byte[] LuaFile(ref string filepath)
        {
            //TextAsset script = Resources.Load("lua/" + filepath + ".lua") as TextAsset;
            //return script.bytes;
            return File.ReadAllBytes(filepath);
        }

        /**
        * 当该工人被任职到某个工厂时触发。
        */
        override protected void onRegister()
        {
            base.onRegister();
            callLuaFun(SAACollection.luaRegister);
        }
        /**
        * 当该工人从某个工厂被解雇时触发。
        */
        override protected void onRemove()
        {
            base.onRemove();
            callLuaFun(SAACollection.luaRemove);
        }
        override protected void onRegisterComplete()
        {
            base.onRegisterComplete();
            callLuaFun(SAACollection.luaRegisterComplete);
        }
        protected void callLuaFun(string funName, System.Object value = null)
        {
            if (null != luaEnv)
            {
                LuaFunction func = luaEnv.Global.Get<LuaFunction>(funName);
                if (null != func)//没有对应的lua类
                {
                    if (null != value)
                    {
                        func.Call(value);
                    }
                    else
                    {
                        func.Call();
                    }
                }
                func.Dispose();
            }
        }
    }
}