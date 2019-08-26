using UnityEngine;
using System.Collections;
 
using Sacu.Utils;
using Sacu.Collection;
public class ETFXProjectileScript : MonoBehaviour
{
    public GameObject impactParticle;
    public GameObject projectileParticle;
    public GameObject muzzleParticle;
    public GameObject[] trailParticles;
    [HideInInspector]
    public Vector3 impactNormal; //Used to rotate impactparticle.
 
    private bool hasCollided = false;

    public static float _whalf;
    public static float _hhalf;
    void Start()
    {
        projectileParticle = Instantiate(projectileParticle, transform.position, transform.rotation) as GameObject;
        projectileParticle.transform.parent = transform;
		if (muzzleParticle){
        muzzleParticle = Instantiate(muzzleParticle, transform.position, transform.rotation) as GameObject;
        Destroy(muzzleParticle, 1.5f); // Lifetime of muzzle effect.
		}
    }
	void Update(){
        Vector3 pos = transform.position;
        if (pos.x > SAACollection.halfWidth || pos.x < -SAACollection.halfWidth || pos.y > SAACollection.halfHeight || pos.y < -SAACollection.halfHeight)
        {//判断越界
            Destroy(gameObject);
            Destroy(projectileParticle);
        }
	}
	void OnTriggerEnter(Collider hit)//自己用
	{
		if (!hasCollided) {
			if (hit.gameObject.tag == "fish") {//掉血
                hit.gameObject.GetComponentInParent<FishSwim>().hit();
			}
			removeParticle ();
		}
	}
	void OnCollisionEnter(Collision hit)
	{
        if (!hasCollided)
        {
            if (hit.gameObject.tag == "Destructible") // Projectile will destroy objects tagged as Destructible
            {
                Destroy(hit.gameObject);
            }
			removeParticle ();
        }
    }
	void removeParticle(){
		hasCollided = true;
		//transform.DetachChildren();
		impactParticle = Instantiate(impactParticle, transform.position, Quaternion.FromToRotation(Vector3.up, impactNormal)) as GameObject;
		//Debug.DrawRay(hit.contacts[0].point, hit.contacts[0].normal * 1, Color.yellow);
		//yield WaitForSeconds (0.05);
		foreach (GameObject trail in trailParticles)
		{
			GameObject curTrail = transform.Find(projectileParticle.name + "/" + trail.name).gameObject;
			curTrail.transform.parent = null;
			Destroy(curTrail, 3f);
		}
		Destroy(projectileParticle, 3f);
		Destroy(impactParticle, 5f);
		Destroy(gameObject);
		//projectileParticle.Stop();

		ParticleSystem[] trails = GetComponentsInChildren<ParticleSystem>();
		//Component at [0] is that of the parent i.e. this object (if there is any)
		for (int i = 1; i < trails.Length; i++)
		{
			ParticleSystem trail = trails[i];
			if (!trail.gameObject.name.Contains("Trail"))
				continue;

			trail.transform.SetParent(null);
			Destroy(trail.gameObject, 2);
		}
	}
}