using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using Sacu.Utils;
using Graphs;
using Sacu.Collection;

public class FishSwim : MonoBehaviour {

	private bool hasCollided = false;
	private int life = 100;
	private StadiumGraphWorker graph;
	private int type;
	// Use this for initialization
	void Start () {
		
	}

	public void setInfo(StadiumGraphWorker graph, int type){
		this.graph = graph;
		this.type = type;
	}
	
	// Update is called once per frame
	void Update () {
		if (life > 0) {
			transform.Translate (Vector3.left * 2 * Time.deltaTime);
		} else {
			Material m = gameObject.GetComponentInChildren<SkinnedMeshRenderer> ().material;
			float s = m.GetFloat ("_Shine");
			m.SetFloat ("_Shine", s - 0.01f);
		}
	}

	public void hit(){
		if ((life -= 30) <= 0) {
			gameObject.GetComponent<Animator> ().Play ("die");
			gameObject.GetComponent<Collider> ().enabled = false;
			graph.dispatchEvent (SAACollection.AddScore, type * 10);
			SAUtils.Log ("加分");
		}
	}
}
