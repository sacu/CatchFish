using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Sacu.Utils;
using System;

namespace fish{
	public class FishFactory {
		private static string[] fishes = {"cheqiyu", "denglongyu", "dianmanyu", "dinianyu", "fangyu", "haigui", "hetun", "jianyu", "jinqiangyu", "shayu", "shiziyu", "tianshiyu", "xiaochouyu", "xiaohuangyu", "xiaolvyu"};
		public static int _w = Screen.width / 32;
		public static int _h = Screen.height / 32;
		public static int _whalf = _w / 2;
		public static int _hhalf = _h / 2;
		public static void RandomFish(){
			string fishName = fishes[UnityEngine.Random.Range (0, fishes.Length - 2)];
			GameObject test = GameObject.Instantiate((GameObject)SACache.getObjectWithName("model/" + fishName + "/" + fishName));
			int dir = UnityEngine.Random.Range (0, 3);
			float pos = UnityEngine.Random.Range (0, _h) - _hhalf;
			int or = pos > 0 ? 1 : -1;
			float npos = - pos;
			double angle = (npos > pos ? (npos - pos) / _w : (pos - npos) / _w);
			angle *= 180/ Math.PI;
			Vector3 v3 = new Vector3 (0, pos, 0);
			Vector3 q = new Vector3 (0, 0, 0);
			if (dir == 0) {//left	0
				//test.transform.
				v3.x = -_whalf;
				q.z = -or * (float)angle;
				q.y = 180;
			} else {//right			1
				v3.x = _whalf;
				q.z = or * (float)angle;
			}

			test.transform.eulerAngles = q;
			test.transform.position = v3;
			test.AddComponent<FishSwim> ();
			//test.transform.SetPositionAndRotation(v3, q);
		}

		public static void CreateFish(){

		}

	}
}

