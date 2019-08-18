using Sacu.Factory.Worker;
using System.Threading;
using Sacu.Utils;
using Datas;
using Sacu.Collection;
using System;
using UnityEngine;
using org.jiira.protobuf;

namespace Graphs
{
    public class HeartGraphWorker : SAGraphWorker
    {
        private const string updateStr = "luaUpdate";
        private CHeart.Builder _heart;
        private SocketDataWorker sock;
        override protected void init()
        {
            base.init();
            _heart = CHeart.CreateBuilder();
        }
        override protected void mainStart()
        {
            SAUtils.Log("start heart");
            base.mainStart();
            SAAppConfig.Thread = true;
            sock = (SocketDataWorker)IOCManager.Instance.getIOCDataWorker("Datas.SocketDataWorker");
            new Thread(heart).Start();
        }
        private void heart()
        {
            while (SAAppConfig.Thread)
            {
                _heart.Clear();
                _heart.Time = System.DateTime.Now.Ticks;
                sock.sendMessage(ProtoTypeEnum.CHeart, _heart.Build().ToByteArray());
                Thread.Sleep(1000);
            }
        }
        
        void OnApplicationQuit()
        {
            SAAppConfig.Thread = false;
            SocketDataWorker sock = IOCManager.Instance.getIOCDataWorker("Datas.SocketDataWorker") as SocketDataWorker;
            sock.close();
        }
    }
}
