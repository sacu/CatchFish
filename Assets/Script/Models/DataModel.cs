
using System.Collections.Generic;
using System;
using UnityEngine;
using System.IO;

using System.Reflection;

using Sacu.Utils;
namespace Models
{
    public class DataModel
    {
        public int ErrorID = 1;//SharedDefine.Share.Error_OK;
        public static Dictionary<int, DataModel> protocolType = new Dictionary<int, DataModel>();
        public static DataModel getDataModel(ushort type)
        {
            DataModel model = null;
            if (!protocolType.ContainsKey(type))
            {
                //if (CommandCollection.protocolType.ContainsKey(type))
                //{
                //    string modelName = CommandCollection.protocolType[type];
                //    try
                //    {
                //        model = (DataModel)Type.GetType(modelName).GetConstructor(new Type[] { }).Invoke(new System.Object[] { });
                //        protocolType.Add(type, model);
                //    }
                //    catch (Exception ex)
                //    {
                //        SAUtils.LogWarning("error model : [" + modelName + "] , ");
                //        throw new Exception("Model类型实例失败 : " + ex.Message);
                //    }
                //}
                //else
                //{
                //    //throw new Exception("CommandCollection protocolType 后台数据表未找到 \"" + type + "\" 标识");
                //}
            }
            else
            {
                model = protocolType[type];
            }
            return model;
        }
        //public static T getData<T>(byte[] bytes)
        //{
        //    MemoryStream _stream = new MemoryStream(bytes);
        //    return Serializer.Deserialize<T>(_stream);
        //}
        virtual public void setDataModel(byte[] bytes)
        {
            throw new Exception("不能直接调用此方法");
        }
    }

}
