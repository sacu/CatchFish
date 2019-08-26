using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using Sacu.Utils;
using Graphs;
using Sacu.Collection;
using System;

public class FishSwim2 : MonoBehaviour {

	private bool hasCollided = false;
	private int life = 100;
	private StadiumGraphWorker graph;
    private FishData fd;

    // Use this for initialization
    void Start () {
        
    }

	public void setInfo(StadiumGraphWorker graph, FishData fd)
    {
        this.graph = graph;
        this.fd = fd;

        int dir = UnityEngine.Random.Range(0, 3);
        float pos = UnityEngine.Random.Range(0, SAACollection.height) - SAACollection.halfHeight;
        int or = pos > 0 ? 1 : -1;
        float npos = UnityEngine.Random.Range(0, SAACollection.height) - SAACollection.halfHeight;
        double angle = (npos > pos ? (npos - pos) / SAACollection.width : (pos - npos) / SAACollection.halfWidth);
        angle *= 180 / Math.PI;
        Vector3 v3 = new Vector3(0, pos, 0);
        Vector3 q = new Vector3(0, 0, 0);
        if (dir == 0)
        {//left	0
         //test.transform.
            v3.x = -SAACollection.halfWidth;
            q.z = -or * (float)angle;
            q.y = 180;
        }
        else
        {//right			1
            v3.x = SAACollection.halfWidth;
            q.z = or * (float)angle;
        }

        transform.eulerAngles = q;
        transform.position = v3;
    }

    // Update is called once per frame
    void Update () {
        Vector3 pos = transform.position;
        if (pos.x > SAACollection.halfWidth || pos.x < -SAACollection.halfWidth || pos.y > SAACollection.halfHeight || pos.y < -SAACollection.halfHeight)
        {//判断越界
            Destroy(gameObject);
        } else if (life > 0) {
			transform.Translate (Vector3.left * 2 * Time.deltaTime);
		} else {
			Material m = gameObject.GetComponentInChildren<SkinnedMeshRenderer> ().material;
			float s = m.GetFloat ("_Shine");
			m.SetFloat ("_Shine", s - 0.002f);
		}
	}

	public void hit(){
		if ((life -= 30) <= 0) {
			gameObject.GetComponent<Animator> ().Play ("die");
			gameObject.GetComponent<Collider> ().enabled = false;
			graph.dispatchEvent (SAACollection.AddScore, fd);
			SAUtils.Log ("加分");
		}
	}
}
