using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Sacu.Factory.Worker;
using Sacu.Utils;
using Sacu.Events;
using org.jiira.protobuf;
using Datas;

namespace Graphs
{
    public class ErrorCodeGraphWorker : SAGraphWorker
    {

        protected override void init()
        {
            base.init();
        }
        override protected void onRegister()
        {
            base.onRegister();
            addEventDispatcherWithHandle(CommandCollection.Sock + ProtoTypeEnum.SError, errorHandler);//错误码处理
        }
        override protected void onRemove()
        {
            base.onRemove();
            removeEventDispatcher(CommandCollection.Sock + ProtoTypeEnum.SError);//帐号或密码错误
        }

        private void errorHandler(SAFactoryEvent e)
        {
            SASocketDataDAO sdd = (SASocketDataDAO)e.Body;
            SError.Builder error = (SError.Builder)CommandCollection.getDataModel(ProtoTypeEnum.SError, sdd.bytes);
            SAUtils.LogError("错误码 : " + error.Code);
        }
    }
}