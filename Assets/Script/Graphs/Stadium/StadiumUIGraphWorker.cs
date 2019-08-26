using System.Collections;
using System.Collections.Generic;
using Sacu.Factory.Worker;
using UnityEngine;
using System;
using Sacu.Utils;

using Sacu.Collection;
using Sacu.Events;
using org.jiira.protobuf;
namespace Graphs
{
	public class StadiumUIGraphWorker : SAGraphWorker {
		private UILabel lblScore;
		protected override void init()
		{
			base.init ();
			Transform tf = SATransform.Find ("lblScore");
			lblScore = tf.GetComponent<UILabel>();
		}
		override protected void onRegister()
		{
			base.onRegister ();
			addEventDispatcherWithHandle(SAACollection.AddScore, addScoreHandler);
		}
		override protected void onRemove()
		{
			base.onRemove ();
			removeEventDispatcher (SAACollection.AddScore);
		}

		private void addScoreHandler(SAFactoryEvent action){
            FishData fd =(FishData)action.Body;
			lblScore.text = "分数 : " + STFish.getMap()[fd.fishID].Coin;
		}
	}
}
