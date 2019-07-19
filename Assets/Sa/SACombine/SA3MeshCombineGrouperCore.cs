using UnityEngine;
using System;
using SA.Core;
using System.Collections.Generic;

[Serializable]
public class SA3MeshCombineGrouperCore {
    public enum ClusterType
    {
        none,
        grid,
        pie,
        //voroni,
    }

    [Serializable]
    public class ClusterGrouper
    {

        public ClusterType clusterType;
        public Vector3 origin;
        //for grid
        public Vector3 cellSize;
        //for pie
        public int pieNumSegments = 4;
        public Vector3 pieAxis = Vector3.up;

        public Dictionary<string, List<Renderer>> FilterIntoGroups(List<GameObject> selection)
        {
            if (clusterType == ClusterType.none)
            {
                return FilterIntoGroupsNone(selection);
            }
            else if (clusterType == ClusterType.grid)
            {
                return FilterIntoGroupsGrid(selection);
            }
            else if (clusterType == ClusterType.pie)
            {
                return FilterIntoGroupsPie(selection);
            }
            return new Dictionary<string, List<Renderer>>();
        }

        public Dictionary<string, List<Renderer>> FilterIntoGroupsNone(List<GameObject> selection)
        {
            Debug.Log("Filtering into groups none");

            Dictionary<string, List<Renderer>> cell2objs = new Dictionary<string, List<Renderer>>();

            List<Renderer> rs = new List<Renderer>();
            for (int i = 0; i < selection.Count; i++)
            {
                rs.Add(selection[i].GetComponent<Renderer>());
            }

            cell2objs.Add("SA", rs);
            return cell2objs;
        }

        public Dictionary<string, List<Renderer>> FilterIntoGroupsGrid(List<GameObject> selection)
        {
            Dictionary<string, List<Renderer>> cell2objs = new Dictionary<string, List<Renderer>>();
            if (cellSize.x <= 0f || cellSize.y <= 0f || cellSize.z <= 0f)
            {
                Debug.LogError("cellSize x,y,z must all be greater than zero.");
                return cell2objs;
            }

            Debug.Log("Collecting renderers in each cell");
            foreach (GameObject t in selection)
            {
                GameObject go = t;
                Renderer[] mrs = go.GetComponentsInChildren<Renderer>();
                for (int j = 0; j < mrs.Length; j++)
                {
                    if (mrs[j] is MeshRenderer || mrs[j] is SkinnedMeshRenderer)
                    {
                        //get the cell this gameObject is in
                        Vector3 gridVector = mrs[j].transform.position;
                        gridVector.x = Mathf.Floor((gridVector.x - origin.x) / cellSize.x) * cellSize.x;
                        gridVector.y = Mathf.Floor((gridVector.y - origin.y) / cellSize.y) * cellSize.y;
                        gridVector.z = Mathf.Floor((gridVector.z - origin.z) / cellSize.z) * cellSize.z;
                        List<Renderer> objs = null;
                        string gridVectorStr = gridVector.ToString();
                        if (cell2objs.ContainsKey(gridVectorStr))
                        {
                            objs = cell2objs[gridVectorStr];
                        }
                        else
                        {
                            objs = new List<Renderer>();
                            cell2objs.Add(gridVectorStr, objs);
                        }
                        objs.Add(mrs[j]);
                    }
                }
            }
            return cell2objs;
        }

        public Dictionary<string, List<Renderer>> FilterIntoGroupsPie(List<GameObject> selection)
        {
            Dictionary<string, List<Renderer>> cell2objs = new Dictionary<string, List<Renderer>>();
            if (pieNumSegments == 0)
            {
                Debug.LogError("pieNumSegments must be greater than zero.");
                return cell2objs;
            }

            if (pieAxis.magnitude <= .000001f)
            {
                Debug.LogError("Pie axis must have length greater than zero.");
                return cell2objs;
            }

            pieAxis.Normalize();
            Quaternion pieAxis2yIsUp = Quaternion.FromToRotation(pieAxis, Vector3.up);

            Debug.Log("Collecting renderers in each cell");
            foreach (GameObject t in selection)
            {
                GameObject go = t;
                Renderer[] mrs = go.GetComponentsInChildren<Renderer>();
                for (int j = 0; j < mrs.Length; j++)
                {
                    if (mrs[j] is MeshRenderer || mrs[j] is SkinnedMeshRenderer)
                    {
                        //get the cell this gameObject is in
                        Vector3 origin2obj = mrs[j].transform.position - origin;
                        origin2obj.Normalize();
                        origin2obj = pieAxis2yIsUp * origin2obj;

                        float d_aboutY = 0f;
                        if (Mathf.Abs(origin2obj.x) < 10e-5f && Mathf.Abs(origin2obj.z) < 10e-5f)
                        {
                            d_aboutY = 0f;
                        }
                        else
                        {
                            d_aboutY = Mathf.Atan2(origin2obj.z, origin2obj.x) * Mathf.Rad2Deg;
                            if (d_aboutY < 0f) d_aboutY = 360f + d_aboutY;
                        }

                        int segment = Mathf.FloorToInt(d_aboutY / 360f * pieNumSegments);

                        List<Renderer> objs = null;
                        string segStr = "seg_" + segment;
                        if (cell2objs.ContainsKey(segStr))
                        {
                            objs = cell2objs[segStr];
                        }
                        else
                        {
                            objs = new List<Renderer>();
                            cell2objs.Add(segStr, objs);
                        }
                        objs.Add(mrs[j]);
                    }
                }
            }
            return cell2objs;
        }
    }

    public ClusterGrouper clusterGrouper;
    public bool clusterOnLMIndex;

    public void DoClustering(SA3TextureCombine combine)
    {
        if (clusterGrouper == null)
        {
            Debug.LogError("Cluster Grouper was null.");
            return;
        }

        //todo warn for no objects and no material bake result
        Dictionary<string, List<Renderer>> cell2objs = clusterGrouper.FilterIntoGroups(combine.GetObjectsToCombine());

        Debug.Log("Found " + cell2objs.Count + " cells with Renderers. Creating bakers.");
        if (clusterOnLMIndex)
        {
            Dictionary<string, List<Renderer>> cell2objsNew = new Dictionary<string, List<Renderer>>();
            foreach (string key in cell2objs.Keys)
            {
                List<Renderer> gaws = cell2objs[key];
                Dictionary<int, List<Renderer>> idx2objs = GroupByLightmapIndex(gaws);
                foreach (int keyIdx in idx2objs.Keys)
                {
                    string keyNew = key + "-LM-" + keyIdx;
                    cell2objsNew.Add(keyNew, idx2objs[keyIdx]);
                }
            }
            cell2objs = cell2objsNew;
        }
        foreach (string key in cell2objs.Keys)
        {
            List<Renderer> gaws = cell2objs[key];
            AddCombine(combine, key, gaws);
        }
    }

    Dictionary<int, List<Renderer>> GroupByLightmapIndex(List<Renderer> gaws)
    {
        Dictionary<int, List<Renderer>> idx2objs = new Dictionary<int, List<Renderer>>();
        for (int i = 0; i < gaws.Count; i++)
        {
            List<Renderer> objs = null;
            if (idx2objs.ContainsKey(gaws[i].lightmapIndex))
            {
                objs = idx2objs[gaws[i].lightmapIndex];
            }
            else
            {
                objs = new List<Renderer>();
                idx2objs.Add(gaws[i].lightmapIndex, objs);
            }
            objs.Add(gaws[i]);
        }
        return idx2objs;
    }

    void AddCombine(SA3TextureCombine tb, string key, List<Renderer> gaws)
    {
        int numVerts = 0;
        for (int i = 0; i < gaws.Count; i++)
        {
            Mesh m = SAUtility.GetMesh(gaws[i].gameObject);
            if (m != null)
                numVerts += m.vertexCount;
        }

        GameObject nmb = new GameObject("CombineIn." + key);
        nmb.transform.position = Vector3.zero;
        SA3MeshCombineCommon newCombine;
        if (numVerts >= 65535)
        {
            newCombine = nmb.AddComponent<SA3MultiMeshCombine>();
            newCombine.useObjsToMeshFromTexBaker = false;
        }
        else
        {
            newCombine = nmb.AddComponent<SA3MeshCombine>();
            newCombine.useObjsToMeshFromTexBaker = false;
        }
        newCombine.textureBakeResults = tb.textureBakeResults;
        newCombine.transform.parent = tb.transform;
        for (int i = 0; i < gaws.Count; i++)
        {
            newCombine.GetObjectsToCombine().Add(gaws[i].gameObject);
        }
    }
}
