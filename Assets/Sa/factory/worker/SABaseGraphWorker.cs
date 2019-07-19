﻿using UnityEngine;
using System.Collections.Generic;
using Sacu.Events;
using System;
using System.Reflection;

namespace Sacu.Factory.Worker
{
    public class SABaseGraphWorker : MonoBehaviour, ISAWorker
    {

        protected bool IsMainStart = false;//unity 主线程入口
        protected bool IsNew = false;//工人创建
        protected bool IsStart = false;//工人启动
        protected bool IsRegister = false;//工人注册到工厂
        protected bool IsRemove = false;//工人从工厂移除
        protected bool IsRegisterComplete = false;//工厂注册完毕
        protected bool IsDispose = false;//工厂关闭

        private System.Object args;
        protected bool _start;
        public SABaseFactory factory;
        protected string luaName;
        protected string originName;
        private string _name;
        protected string displayName;
        protected string patchName;
        private bool _isActiveDispose;
        protected bool _isActive;
        protected Vector3 HideVec3;
        protected Vector3 ShowVec3;
        private bool defaultStart;
        //public ArrayList events;//事件集
        protected List<SAFactoryEvent> suspendeds;
        protected SAFactoryEvent lateUpdateAction;
        private MethodInfo lateUpdateMethodInfo;
        private ParameterInfo[] lateUpdateParamsInfo;

        public Dictionary<string, string> handleActions;

        private GameObject _SAGameObject;
        private Transform _SATransform;
        /**
        * 构造函数
        * @param name 工人名称。
        * @param base 图形工人所控制的图形实例。
        */
        //public GraphWorker(string id, UnityEngine.GameObject baseObject):base(id)
        //{
        //    this.gameBase = baseObject;
        //    events = new ArrayList();
        //}

        // Use this for initialization
        void Start()
        {
            _start = true;
            if (IsNew)
            {
                IsMainStart = true;
            }
        }
        public void setOrigin(GameObject SAGameObject, Transform SATransform)
        {
            _SAGameObject = SAGameObject;
            _SATransform = SATransform;
        }
        public void setActiveDispose(bool flag)
        {
            _isActiveDispose = flag;
        }
        public void setDefaultStart(bool flag)
        {
            defaultStart = flag;
        }
        virtual public void destroyDisplay()
        {
            Destroy(gameObject);
            Destroy(this);
        }
        public string getName()
        {
            return _name;
        }

        public void setName(string value)
        {
            _name = value;
        }
        virtual protected void mainStart()
        {
            IsMainStart = false;
        }
        virtual public void _init(string DotName, string NoDotName)
        {
            if (!IsNew)
            {
                IsNew = true;
                this.displayName = DotName;
                this.patchName = NoDotName;
                _name = this.ToString() + this.GetHashCode();
                _isActive = true;
                handleActions = new Dictionary<string, string>();
                suspendeds = new List<SAFactoryEvent>();
                HideVec3 = new Vector3(-1, -1, -1);
            }
        }

        public GameObject SAGameObject
        {
            get
            {
                return _SAGameObject;
            }
        }
        public Transform SATransform
        {
            get
            {
                return _SATransform;
            }
        }

        virtual protected void init()
        {
            IsNew = false;
            if (_start)
            {
                IsMainStart = true;
            }
        }
        public string DisplayName
        {
            get
            {
                return displayName;
            }
        }
        public void initialize(SABaseFactory factory)
        {
            this.factory = factory;
        }
        public void unInitialize(SABaseFactory factory)
        {
            this.factory = null;
        }
        public void dispatchEvent(string type, System.Object body = null)
        {
            if (factory != null)
            {
                factory.dispatchEvent(type, body, this);
            }
        }

        /**
        * 当该工人被任职到某个工厂时触发。
        */
        public void _onRegister()
        {
            IsRegister = true;
        }
        virtual protected void onRegister()
        {
            IsRegister = false;
        }
        /**
        * 当该工人从某个工厂被解雇时触发。
        * 从工厂释放引用
        */
        public void _onRemove()
        {
            IsRemove = true;
        }
        virtual protected void onRemove()
        {
            IsRemove = false;
        }
        public void _onRegisterComplete()
        {
            IsRegisterComplete = true;
        }
        virtual protected void onRegisterComplete()
        {
            IsRegisterComplete = false;
        }

        public void _onSrart(System.Object args)
        {
            this.args = args;
            IsStart = true;
        }
        virtual protected void onSrart(System.Object args)
        {
            IsStart = false;
            if (defaultStart)
            {
                setActive(true);
            }
        }
        /// <summary>
        /// 隐藏操作
        /// </summary>
        public void _onDispose()
        {
            IsDispose = true;
        }
        virtual protected void onDispose()
        {
            IsDispose = false;
            setActive(false);
        }
        public void setActive(bool flag)
        {
            if (_isActive == flag)
            {
                return;
            }
            _isActive = flag;
            if (_isActiveDispose)
            {
                SAGameObject.SetActive(_isActive);
            }
            else
            {
                if (_isActive)
                {
                    transform.localPosition = ShowVec3;
                }
                else
                {
                    ShowVec3 = transform.localPosition;
                    transform.localPosition = HideVec3;
                }
            }
        }
        /**
        * 通过工厂派发消息后从这里得到派发数据。
        * @param action 消息内容，常用属于性有type（消息类型）、body（消息携带的数据）。
        * @see FactoryEvent
        * 
        * 线程锁在这里处理
        */
        public void handleAction(SAFactoryEvent action)
        {
            suspendeds.Add(action);
            //		    trace("MVC : "+this+" < "+action.type);
        }

        void LateUpdate()
        {
            if (suspendeds != null && suspendeds.Count > 0)
            {
                while (suspendeds.Count > 0)
                {
                    lateUpdateAction = suspendeds[0];
                    suspendeds.RemoveAt(0);
                    LateEvent();
                }
            }
            //生命周期线程合并
            if (IsNew) init();
            if (IsMainStart) mainStart();
            if (IsStart) onSrart(args);
            if (IsRegister) onRegister();
            if (IsRegisterComplete) onRegisterComplete();
            if (IsRemove) onRemove();
            if (IsDispose) onDispose();
        }
        virtual protected void LateEvent()
        {
            suspendeds.Remove(lateUpdateAction);
            if (handleActions.ContainsKey(lateUpdateAction.Type))
            {
                string handleName = handleActions[lateUpdateAction.Type];
                if (handleActions.ContainsKey(lateUpdateAction.Type))
                {
                    lateUpdateMethodInfo = GetType().GetMethod(handleName, BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.Public);
                    if (lateUpdateMethodInfo != null)
                    {
                        lateUpdateParamsInfo = lateUpdateMethodInfo.GetParameters();//得到指定方法的参数列表
                        if (lateUpdateParamsInfo.Length == 1)
                        {//参数数量
                            if (lateUpdateAction.GetType().Equals(lateUpdateParamsInfo[0].ParameterType))
                            {
                                try
                                {
                                    lateUpdateMethodInfo.Invoke(this, new System.Object[] { lateUpdateAction });
                                }
                                catch (Exception ex)
                                {
                                    UnityEngine.Debug.LogError(ex.Message);
                                }
                            }
                        }
                    }
                }
            }
        }
        /**
        * 添加一个关心消息类型到该工人。
        * @param type 消息类型。
        * @return 消息类型添加成功则返回true，否则返回false。
        */
        public bool addEventDispatcherWithHandle(string type, Action<SAFactoryEvent> handle)
        {
            return addEventDispatcherWithHandle(type, handle.Method.Name);
        }
        public bool addEventDispatcherWithHandle(string type, string handle)
        {
            if (handleActions.ContainsKey(type))
            {
                Debug.LogError("重复监听的方法 : " + handle + " (" + this.ToString() + ")");
                return false;
            }
            else
            {
                handleActions.Add(type, handle);
                if (factory != null)
                {
                    //解决线程问题
                    factory.addEventDispatcher(type, this, "handleAction");
                }
            }
            return true;
        }
        /**
        * 添加一个关心消息类型到该工人。
        * @param type 消息类型。
        * @return 消息类型添加成功则返回true，否则返回false。
        */
        //	public function releasingGraphWorker():void{
        //	}
        /**
        * 移除一个以添加的消息类型从该工人。
        * @param type 消息类型。
        * @return 消息类型移除成功则返回true，否则返回false。
        */
        public bool removeEventDispatcher(string type)
        {
            if (handleActions.ContainsKey(type))
            {
                handleActions.Remove(type);
                //factory.removeEventDispatcher(type, this, handleActions[type]);
                factory.removeEventDispatcher(type, this, "handleAction");
                return true;
            }
            return false;
        }
    }
}
