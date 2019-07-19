using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using SA.Core;
public abstract class SA3MeshCombineRoot : MonoBehaviour
{
    [HideInInspector]
    public abstract SA2TextureCombineResults textureBakeResults
    {
        get;
        set;
    }

    //todo switch this to List<Renderer>
    public virtual List<GameObject> GetObjectsToCombine()
    {
        return null;
    }


    public static bool DoCombinedValidate(SA3MeshCombineRoot mom, SAObjsToCombineTypes objToCombineType, SA2EditorMethodsInterface editorMethods)
    {
        if (mom.textureBakeResults == null)
        {
            Debug.LogError("Need to set Material Bake Result on " + mom);
            return false;
        }
        if (!(mom is SA3TextureCombine))
        {
            SA3TextureCombine tb = mom.GetComponent<SA3TextureCombine>();
            if (tb != null && tb.textureBakeResults != mom.textureBakeResults)
            {
                Debug.LogWarning("Material Bake Result on this component is not the same as the Material Bake Result on the SA3TextureCombine.");
            }
        }

        List<GameObject> objsToMesh = mom.GetObjectsToCombine();
        for (int i = 0; i < objsToMesh.Count; i++)
        {
            GameObject go = objsToMesh[i];
            if (go == null)
            {
                Debug.LogError("The list of objects to combine contains a null at position." + i + " Select and use [shift] delete to remove");
                return false;
            }
            for (int j = i + 1; j < objsToMesh.Count; j++)
            {
                if (objsToMesh[i] == objsToMesh[j])
                {
                    Debug.LogError("The list of objects to combine contains duplicates.");
                    return false;
                }
            }
            if (SAUtility.GetGOMaterials(go) == null)
            {
                Debug.LogError("Object " + go + " in the list of objects to be combined does not have a material");
                return false;
            }
            if (SAUtility.GetMesh(go) == null)
            {
                Debug.LogError("Object " + go + " in the list of objects to be combined does not have a mesh");
                return false;
            }
        }

        if (mom.textureBakeResults.doMultiMaterial)
        {
            if (!validateSubmeshOverlap(mom))
            {//only warns currently
                return false;
            }
        }

        List<GameObject> objs = objsToMesh;

        if (mom is SA3MeshCombine)
        {
            objs = mom.GetObjectsToCombine();
            //if (((SA3MeshCombine)mom).useObjsToMeshFromTexBaker && tb != null) objs = tb.GetObjectsToCombine(); 
            if (objs == null || objs.Count == 0)
            {
                Debug.LogError("No meshes to combine. Please assign some meshes to combine.");
                return false;
            }
            if (mom is SA3MeshCombine && ((SA3MeshCombine)mom).meshCombiner.renderType == SARenderType.skinnedMeshRenderer)
            {
                if (!editorMethods.ValidateSkinnedMeshes(objs))
                {
                    return false;
                }
            }
        }

        if (editorMethods != null)
        {
            editorMethods.CheckPrefabTypes(objToCombineType, objsToMesh);
        }
        return true;
    }

    static bool validateSubmeshOverlap(SA3MeshCombineRoot mom)
    {
        List<GameObject> objsToMesh = mom.GetObjectsToCombine();
        for (int i = 0; i < objsToMesh.Count; i++)
        {
            Mesh m = SAUtility.GetMesh(objsToMesh[i]);
            if (SAUtility.doSubmeshesShareVertsOrTris(m) != 0)
            {
                Debug.LogWarning("Object " + objsToMesh[i] + " in the list of objects to combine has overlapping submeshes (submeshes share vertices). If the UVs associated with the shared vertices are important then this bake may not work. If you are using multiple materials then this object can only be combined with objects that use the exact same set of textures (each atlas contains one texture). There may be other undesirable side affects as well. Mesh Master, available in the asset store can fix overlapping submeshes.");
                return true;
            }
        }
        return true;
    }

    //关于Mesh的操作
    public SA3MeshCombineGrouperCore grouper;

    [HideInInspector]
    public Bounds sourceObjectBounds = new Bounds(Vector3.zero, Vector3.one);

    void OnDrawGizmosSelected()
    {
        if (grouper == null) return;
        if (grouper.clusterGrouper == null) return;
        if (grouper.clusterGrouper.clusterType == SA3MeshCombineGrouperCore.ClusterType.grid)
        {
            Vector3 cs = grouper.clusterGrouper.cellSize;
            if (cs.x <= .00001f || cs.y <= .00001f || cs.z <= .00001f) return;
            Vector3 p = sourceObjectBounds.center - sourceObjectBounds.extents;
            Vector3 offset = grouper.clusterGrouper.origin;
            offset.x = offset.x % cs.x;
            offset.y = offset.y % cs.y;
            offset.z = offset.z % cs.z;
            //snap p to closest cell center
            Vector3 start;
            p.x = Mathf.Round((p.x) / cs.x) * cs.x + offset.x;
            p.y = Mathf.Round((p.y) / cs.y) * cs.y + offset.y;
            p.z = Mathf.Round((p.z) / cs.z) * cs.z + offset.z;
            if (p.x > sourceObjectBounds.center.x - sourceObjectBounds.extents.x) p.x = p.x - cs.x;
            if (p.y > sourceObjectBounds.center.y - sourceObjectBounds.extents.y) p.y = p.y - cs.y;
            if (p.z > sourceObjectBounds.center.z - sourceObjectBounds.extents.z) p.z = p.z - cs.z;
            start = p;
            int numcells = Mathf.CeilToInt(sourceObjectBounds.size.x / cs.x + sourceObjectBounds.size.y / cs.y + sourceObjectBounds.size.z / cs.z);
            if (numcells > 200)
            {
                Gizmos.DrawWireCube(grouper.clusterGrouper.origin + cs / 2f, cs);
            }
            else
            {
                for (; p.x < sourceObjectBounds.center.x + sourceObjectBounds.extents.x; p.x += cs.x)
                {
                    p.y = start.y;
                    for (; p.y < sourceObjectBounds.center.y + sourceObjectBounds.extents.y; p.y += cs.y)
                    {
                        p.z = start.z;
                        for (; p.z < sourceObjectBounds.center.z + sourceObjectBounds.extents.z; p.z += cs.z)
                        {
                            Gizmos.DrawWireCube(p + cs / 2f, cs);
                        }
                    }
                }
            }
        }
        if (grouper.clusterGrouper.clusterType == SA3MeshCombineGrouperCore.ClusterType.pie)
        {
            if (grouper.clusterGrouper.pieAxis.magnitude < .1f) return;
            if (grouper.clusterGrouper.pieNumSegments < 1) return;
            float rad = sourceObjectBounds.extents.magnitude;
            DrawCircle(grouper.clusterGrouper.pieAxis, grouper.clusterGrouper.origin, rad, 24);
            Quaternion yIsUp2PieAxis = Quaternion.FromToRotation(Vector3.up, grouper.clusterGrouper.pieAxis);
            Quaternion rStep = Quaternion.AngleAxis(180f / grouper.clusterGrouper.pieNumSegments, Vector3.up);
            Vector3 r = rStep * Vector3.forward;
            for (int i = 0; i < grouper.clusterGrouper.pieNumSegments; i++)
            {
                Vector3 rr = yIsUp2PieAxis * r;
                Gizmos.DrawLine(grouper.clusterGrouper.origin, grouper.clusterGrouper.origin + rr * rad);
                r = rStep * r;
                r = rStep * r;
            }
        }
    }

    public static void DrawCircle(Vector3 axis, Vector3 center, float radius, int subdiv)
    {
        Quaternion q = Quaternion.AngleAxis(360 / subdiv, axis);
        Vector3 r = new Vector3(axis.y, -axis.x, axis.z); //should be perpendicular to axis
        r.Normalize();
        r *= radius;
        for (int i = 0; i < subdiv + 1; i++)
        {
            Vector3 r2 = q * r;
            Gizmos.DrawLine(center + r, center + r2);
            r = r2;
        }
    }
}
