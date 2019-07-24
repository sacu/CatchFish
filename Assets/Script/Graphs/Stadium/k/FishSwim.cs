using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using Sacu.Utils;

public class FishSwim : MonoBehaviour {

	private bool hasCollided = false;
	private int life = 100;
	// Use this for initialization
	void Start () {
		
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
			SAUtils.Log ("加分");
		}
	}
}
