using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using Sacu.Utils;
using Graphs;
using Sacu.Collection;
using System;
using org.jiira.protobuf;

public class FishSwim : MonoBehaviour {
    private Transform fish;
    private STFish stfish;
	private StadiumGraphWorker graph;
    private FishData fd;
    private int life;
    private bool isRight;

    // Use this for initialization
    void Start () {
        
    }

	public void setInfo(StadiumGraphWorker graph, FishData fd, long delay)
    {
        fish = transform.Find(SAAppConfig.Language + "_" + fd.fishID + "s");
        stfish = STFish.getMap()[fd.fishID];
        life = stfish.Life;
        this.graph = graph;
        this.fd = fd;
        float pos;
        float npos;
        isRight = fd.begin < 0;
        if (isRight)//从右侧出发
        {
            pos = SAACollection.height * -fd.begin / 20 - SAACollection.halfHeight;
            npos = SAACollection.height * fd.end / 20 - SAACollection.halfHeight;
            transform.position = new Vector3(SAACollection.halfWidth, pos, 0);
            transform.LookAt(new Vector3(-SAACollection.halfWidth, npos, 0));
        } else
        {
            pos = SAACollection.height * fd.begin / 20 - SAACollection.halfHeight;
            npos = SAACollection.height * -fd.end / 20 - SAACollection.halfHeight;
            transform.position = new Vector3(-SAACollection.halfWidth, pos, 0);
            transform.LookAt(new Vector3(SAACollection.halfWidth, npos, 0));
        }
        //矫正位置
        //transform.Translate(Vector3.forward * stfish.Speed * delay / 1000);
    }

    // Update is called once per frame
    void LateUpdate () {
        Vector3 pos = transform.position;
        if ((!isRight && pos.x > SAACollection.halfWidth) || (isRight && pos.x < -SAACollection.halfWidth))
        {//判断越界
            if (gameObject)
            {
                graph.dispatchEvent(SAACollection.FishDie, fd);
                Destroy(gameObject);
                Destroy(this);
            }
        } else if (life > 0) {
			transform.Translate (Vector3.forward * stfish.Speed * Time.deltaTime);
		} else {
            if (fish)
            {
                Material m = fish.GetComponentInChildren<SkinnedMeshRenderer>().material;
                float s = m.GetFloat("_Shine");
                m.SetFloat("_Shine", s - 0.002f);
            }
		}
	}

	public void hit(){
		if ((life -= 50) <= 0) {
            fish.GetComponent<Animator> ().Play ("die");
            fish.GetComponent<Collider> ().enabled = false;
            graph.dispatchEvent(SAACollection.AddScore, fd);
            graph.dispatchEvent(SAACollection.FishDie, fd);
        }
	}
}