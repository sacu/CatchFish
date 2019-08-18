using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Sacu.Utils;
using Graphs;

namespace fish{
	public class FishFactory {
		private static string[] fishes = {"cheqiyu", "denglongyu", "dianmanyu", "dinianyu", "fangyu", "haigui", "hetun", "jianyu", "jinqiangyu", "shayu", "shiziyu", "tianshiyu", "xiaochouyu", "xiaohuangyu", "xiaolvyu"};
		

		public static void RandomFish(StadiumGraphWorker graph){
            
			int type = UnityEngine.Random.Range (0, fishes.Length - 2);
			string fishName = fishes[type];
			GameObject test = GameObject.Instantiate((GameObject)SACache.getObjectWithName("model/fish/" + fishName));
			
			FishSwim fs = test.AddComponent<FishSwim> ();
			fs.setInfo (graph, type);
			//test.transform.SetPositionAndRotation(v3, q);
		}


		public static void CreateFish(){

		}

	}
}

