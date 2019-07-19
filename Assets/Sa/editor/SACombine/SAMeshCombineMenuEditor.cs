using UnityEngine;
using System.Collections;
using System.IO;
using System;
using System.Collections.Specialized;
using System.Collections.Generic;
using System.Text.RegularExpressions;

using SA.Core;
using UnityEditor;


public class SAMeshCombineMenuEditor : Editor{
    [MenuItem("SA/MeshCombine/Open")]

    public static GameObject CreateMeshCombineController()
    {
        SA3TextureCombine[] mbs = (SA3TextureCombine[])GameObject.FindObjectsOfType(typeof(SA3TextureCombine));
        Regex regex = new Regex(@"(\d+)$", RegexOptions.Compiled | RegexOptions.CultureInvariant);
        int largest = 0;
        try
        {
            for (int i = 0; i < mbs.Length; i++)
            {
                Match match = regex.Match(mbs[i].name);
                if (match.Success)
                {
                    int val = Convert.ToInt32(match.Groups[1].Value);
                    if (val >= largest)
                        largest = val + 1;
                }
            }
        }
        catch (Exception e)
        {
            if (e == null) e = null; //Do nothing supress compiler warning
        }
        GameObject combine = new GameObject("SACombine" + largest);
        combine.transform.position = Vector3.zero;
        SA3TextureCombine tCombine = combine.AddComponent<SA3TextureCombine>();
        tCombine.packingAlgorithm = SA2PackingAlgorithmEnum.Mesh;

        //combine.AddComponent<SA3MeshCombineGrouper>();
        //GameObject meshCombine = new GameObject("SACombine");
        //meshCombine.AddComponent<SA3MeshCombine>();
        //meshCombine.transform.parent = combine.transform;
        return combine.gameObject;
    }
}
