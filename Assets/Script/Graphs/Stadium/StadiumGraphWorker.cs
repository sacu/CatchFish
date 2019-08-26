using System.Collections;
using System.Collections.Generic;
using Sacu.Factory.Worker;
using UnityEngine;
using System;
using Sacu.Utils;
using Sacu.Collection;
using org.jiira.protobuf;
using fish;
using Sacu.Events;
using Datas;
namespace Graphs
{
	public class StadiumGraphWorker : SAGraphWorker
    {
        private SocketDataWorker sock;
        private int hhlaf = Screen.height / 2;
		private Transform c;
		private const int mt = 10;
		private int ct = 0;
		private string[] bullets = {"BulletSmallBlueOBJ", "NovaFireOBJ", "MysticWhiteOBJ"};

        private SFishChapter.Builder fishChapter;
        private FishTarget ft;//当前场景
        private Dictionary<int, FishData> sofVO;//list移除对象不好用
        protected override void init()
		{
			base.init ();
            SAACollection.initScreenToWorldPoint();

            sock = (SocketDataWorker)IOCManager.Instance.getIOCDataWorker("Datas.SocketDataWorker");

            GameObject cannon = getGameObjectForName ("cannon");
			Vector3 pos = cannon.transform.position;
            pos.y = -hhlaf;

            //坐标转换
            //SAUtils.Log("ScreenToViewportPoint: " + Camera.main.ScreenToViewportPoint(pos).y);//屏幕转视口坐标
            //SAUtils.Log("ScreenToWorldPoint: " + Camera.main.ScreenToWorldPoint(pos).y);//屏幕转世界坐标
            //SAUtils.Log("WorldToScreenPoint: " + Camera.main.WorldToScreenPoint(pos).y);//世界转屏幕坐标
            //SAUtils.Log("ViewportToScreenPoint: " + Camera.main.ViewportToScreenPoint(pos).y);//视口转屏幕坐标
            //SAUtils.Log("WorldToViewportPoint: " + Camera.main.WorldToViewportPoint(pos).y);//世界转视口坐标
            //SAUtils.Log("ViewportToWorldPoint: " + Camera.main.ViewportToWorldPoint(pos).y);//视口转世界坐标

            pos = Camera.main.ScreenToWorldPoint(pos);
            pos.y /= 2;
            pos.x = pos.z = 0;
            c = cannon.transform;
			c.position = pos;
            
        }
        
		override protected void mainStart(){
			base.mainStart ();
			SAUtils.Log ("mainStart");
		}
		override protected void onSrart(System.Object args){
			base.onSrart (args);
			SAUtils.Log ("onSrart");
		}
		override protected void onRegisterComplete(){
			base.onRegisterComplete ();
			SAUtils.Log ("onRegisterComplete");
		}
		override protected void onDispose(){
			base.onDispose ();
			SAUtils.Log ("onDispose");
		}
		override protected void onRegister()
		{
			base.onRegister ();
            //addEventDispatcherWithHandle(SAACollection.NewTarget, newTargetHandler);
            addEventDispatcherWithHandle(SAACollection.FishDie, fishDieHandler);
            addEventDispatcherWithHandle(CommandCollection.Sock + ProtoTypeEnum.SFishChapter, fishChapterHandler);
            //获取房间信息
            CEnterRoom.Builder enterRoom = CEnterRoom.CreateBuilder();
            sock.sendMessage(ProtoTypeEnum.CEnterRoom, enterRoom.Build().ToByteArray());
            SAUtils.Log ("onRegister");
        }
        private void fishChapterHandler(SAFactoryEvent action)
        {
            SASocketDataDAO sdd = (SASocketDataDAO)action.Body;
            fishChapter = (SFishChapter.Builder)CommandCollection.getDataModel(ProtoTypeEnum.SFishChapter, sdd.bytes);
            //关卡信息
            Dictionary<int, STChapter> chapterMap = STChapter.getMap();
            STChapter chapterData = chapterMap[fishChapter.ChapterID];//关卡信息
            string[] fishData = chapterData.SOF;//关卡鱼群
            List<FishData> sof = new List<FishData>();//关卡鱼群数据整理
            sofVO = new Dictionary<int, FishData>();
            FishData fd;
            int len = fishChapter.FishListCount;//只遍历存活的鱼群下标
            int exist;//存活鱼的序号
            for (int i = 0; i < len; ++i)//排列大小
            {
                exist = fishChapter.GetFishList(i);
                fd = new FishData(exist, fishData[exist]);//找到存活的鱼数据
                sof.Add(fd);
                sofVO.Add(exist, fd);
            }
            sof.Sort((FishData f1, FishData f2) => //从小到大
            {
                return f1.delay - f2.delay;
            });
            ft = gameObject.GetComponent<FishTarget>();
            if (null != ft)
            {
                ft.close();
                Destroy(ft);
            }

            ft = gameObject.AddComponent<FishTarget>();
            ft.init(this, fishChapter.StartTime, fishChapter.CurrentTime, sof);
        }

        private void fishDieHandler(SAFactoryEvent action)
        {
            FishData fs = (FishData)action.Body;
            if (sofVO.ContainsKey(fs.id))
            {
                sofVO.Remove(fs.id);
            }
            
            if (sofVO.Count == 0)//发送挂起
            {
                CHangUpRoom.Builder hangUpRoom = CHangUpRoom.CreateBuilder();
                sock.sendMessage(ProtoTypeEnum.CHangUpRoom, hangUpRoom.Build().ToByteArray());
            }
        }
        override protected void onRemove()
		{
			base.onRemove ();
			SAUtils.Log ("onRemove");
		}
		
		void Update()
		{
			Vector3 pos = Input.mousePosition;
			float px = Math.Abs(pos.x) - Screen.width / 2;
			float py = pos.y;// + hhlaf;
			Vector3 q = c.eulerAngles;
			double angle = 0;
			if (px == 0) {
				if (py > 0)
					angle = 90;
				if (py < 0)
					angle = 270;
			} else {
				double tan = py / px;
				if (px > 0) {
					angle = Math.Atan (tan) * 180 / Math.PI - 90;
				} else {
					angle = Math.Atan (tan) * 180 / Math.PI + 90;
				}

			}
			q.z = (float)angle;
			c.eulerAngles = q;
			if(Input.GetKey(KeyCode.Mouse0)){
				if (++ct > mt) {
					ct = 0;
					GameObject projectile = GameObject.Instantiate ((GameObject)SACache.getObjectWithName ("model/bullet/" + bullets [UnityEngine.Random.Range(0, bullets.Length)]));
					projectile.transform.position = c.position;
					projectile.transform.eulerAngles = q;
					projectile.GetComponent<Rigidbody> ().AddForce (projectile.transform.up * 400);
					projectile.GetComponent<ETFXProjectileScript> ().impactNormal = Vector3.forward;
				}
			}
		}
	}
}
