using System.Collections;
using System.Collections.Generic;
using Sacu.Factory.Worker;
using UnityEngine;
using System;
using Sacu.Utils;
using Sacu.Collection;

namespace Graphs
{
	public class StadiumGraphWorker : SAGraphWorker {
		private int hhlaf = Screen.height / 2;
		private Transform c;
		private const int mt = 10;
		private int ct = 0;
		private string[] bullets = {"BulletSmallBlueOBJ", "NovaFireOBJ", "MysticWhiteOBJ"};
		protected override void init()
		{
			base.init ();
            SAACollection.initScreenToWorldPoint();

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

            SAUtils.Log("pos : " + pos);

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
			StartCoroutine("DoSomething");
			SAUtils.Log ("onRegister");
		}
		override protected void onRemove()
		{
			base.onRemove ();
			SAUtils.Log ("onRemove");
		}
		IEnumerator DoSomething () {
			for (int i = 0; i < 300; ++i) {
				fish.FishFactory.RandomFish (this);
				yield return new WaitForSeconds(1);
			}
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
