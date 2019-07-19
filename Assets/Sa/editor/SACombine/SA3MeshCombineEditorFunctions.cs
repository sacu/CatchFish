using UnityEngine;
using UnityEditor;
using System.Collections.Generic;
using SA.Core;
using System;
using System.IO;

public class SA3MeshCombineEditorFunctions {
    public static void BakeIntoCombined(SA3MeshCombineCommon mom)
    {
        SA2OutputOptions prefabOrSceneObject = mom.meshCombiner.outputOption;
        if (SA3MeshCombiner.EVAL_VERSION && prefabOrSceneObject == SA2OutputOptions.bakeIntoPrefab)
        {
            Debug.LogError("Cannot BakeIntoPrefab with evaluation version.");
            return;
        }
        if (prefabOrSceneObject != SA2OutputOptions.bakeIntoPrefab && prefabOrSceneObject != SA2OutputOptions.bakeIntoSceneObject)
        {
            Debug.LogError("Paramater prefabOrSceneObject must be bakeIntoPrefab or bakeIntoSceneObject");
            return;
        }

        SA3TextureCombine tb = mom.GetComponent<SA3TextureCombine>();
        if (mom.textureBakeResults == null && tb != null)
        {
            mom.textureBakeResults = tb.textureBakeResults;
        }

        if (!SA3MeshCombineRoot.DoCombinedValidate(mom, SAObjsToCombineTypes.sceneObjOnly, new SA3EditorMethods())) return;
        if (prefabOrSceneObject == SA2OutputOptions.bakeIntoPrefab &&
            mom.resultPrefab == null)
        {
            Debug.LogError("Need to set the Combined Mesh Prefab field. Create a prefab asset, drag an empty game object into it, and drag it to the 'Combined Mesh Prefab' field.");
            return;
        }
        if (mom.meshCombiner.resultSceneObject != null &&
                        (PrefabUtility.GetPrefabType(mom.meshCombiner.resultSceneObject) == PrefabType.ModelPrefab ||
                        PrefabUtility.GetPrefabType(mom.meshCombiner.resultSceneObject) == PrefabType.Prefab))
        {
            Debug.LogWarning("Result Game Object was a project asset not a scene object instance. Clearing this field.");
            mom.meshCombiner.resultSceneObject = null;
        }

        mom.ClearMesh();
        if (mom.AddDeleteGameObjects(mom.GetObjectsToCombine().ToArray(), null, false))
        {
            mom.Apply(Unwrapping.GenerateSecondaryUVSet);
            Debug.Log(String.Format("Successfully baked {0} meshes", mom.GetObjectsToCombine().Count));
            if (prefabOrSceneObject == SA2OutputOptions.bakeIntoSceneObject)
            {
                PrefabType pt = PrefabUtility.GetPrefabType(mom.meshCombiner.resultSceneObject);
                if (pt == PrefabType.Prefab || pt == PrefabType.ModelPrefab)
                {
                    Debug.LogError("Combined Mesh Object is a prefab asset. If output option bakeIntoSceneObject then this must be an instance in the scene.");
                    return;
                }
            }
            else if (prefabOrSceneObject == SA2OutputOptions.bakeIntoPrefab)
            {
                string prefabPth = AssetDatabase.GetAssetPath(mom.resultPrefab);
                if (prefabPth == null || prefabPth.Length == 0)
                {
                    Debug.LogError("Could not save result to prefab. Result Prefab value is not an Asset.");
                    return;
                }
                string baseName = Path.GetFileNameWithoutExtension(prefabPth);
                string folderPath = prefabPth.Substring(0, prefabPth.Length - baseName.Length - 7);
                string newFilename = folderPath + baseName + "-mesh";
                SaveMeshsToAssetDatabase(mom, folderPath, newFilename);

                if (mom.meshCombiner.renderType == SARenderType.skinnedMeshRenderer)
                {
                    Debug.LogWarning("Render type is skinned mesh renderer. " +
                            "Can't create prefab until all bones have been added to the combined mesh object " + mom.resultPrefab +
                            " Add the bones then drag the combined mesh object to the prefab.");

                }
                else
                {
                    RebuildPrefab(mom);
                }
            }
            else
            {
                Debug.LogError("Unknown parameter");
            }
        }

    }

    public static void SaveMeshsToAssetDatabase(SA3MeshCombineCommon mom, string folderPath, string newFileNameBase)
    {
        if (SA3MeshCombiner.EVAL_VERSION) return;
        if (mom is SA3MeshCombine)
        {
            SA3MeshCombine mb = (SA3MeshCombine)mom;
            string newFilename = newFileNameBase + ".asset";
            string ap = AssetDatabase.GetAssetPath(((SA3MeshCombinerSingle)mb.meshCombiner).GetMesh());
            if (ap == null || ap.Equals(""))
            {
                Debug.Log("Saving mesh asset to " + newFilename);
                AssetDatabase.CreateAsset(((SA3MeshCombinerSingle)mb.meshCombiner).GetMesh(), newFilename);
            }
            else
            {
                Debug.Log("Mesh is an asset at " + ap);
            }
        }
        else if (mom is SA3MultiMeshCombine)
        {
            SA3MultiMeshCombine mmb = (SA3MultiMeshCombine)mom;
            List<SA3MultiMeshCombiner.CombinedMesh> combiners = ((SA3MultiMeshCombiner)mmb.meshCombiner).meshCombiners;
            for (int i = 0; i < combiners.Count; i++)
            {
                string newFilename = newFileNameBase + i + ".asset";
                Mesh mesh = combiners[i].combinedMesh.GetMesh();
                string ap = AssetDatabase.GetAssetPath(mesh);
                if (ap == null || ap.Equals(""))
                {
                    Debug.Log("Saving mesh asset to " + newFilename);
                    AssetDatabase.CreateAsset(mesh, newFilename);
                }
                else
                {
                    Debug.Log("Mesh is an asset at " + ap);
                }
            }
        }
        else
        {
            Debug.LogError("Argument was not a SA3MeshCombine or an SA3MultiMeshCombine.");
        }
    }

    public static void RebuildPrefab(SA3MeshCombineCommon mom)
    {
        if (SA3MeshCombiner.EVAL_VERSION) return;
        if (mom is SA3MeshCombine)
        {
            SA3MeshCombine mb = (SA3MeshCombine)mom;
            SA3MeshCombinerSingle mbs = (SA3MeshCombinerSingle)mb.meshCombiner;
            GameObject prefabRoot = mom.resultPrefab;
            GameObject rootGO = (GameObject)PrefabUtility.InstantiatePrefab(prefabRoot);
            SA3MeshCombinerSingle.BuildSceneHierarch(mbs, rootGO, mbs.GetMesh());
            string prefabPth = AssetDatabase.GetAssetPath(prefabRoot);
            PrefabUtility.ReplacePrefab(rootGO, AssetDatabase.LoadAssetAtPath(prefabPth, typeof(GameObject)), ReplacePrefabOptions.ConnectToPrefab);
            Editor.DestroyImmediate(rootGO);
        }
        else if (mom is SA3MultiMeshCombine)
        {
            SA3MultiMeshCombine mmb = (SA3MultiMeshCombine)mom;
            SA3MultiMeshCombiner mbs = (SA3MultiMeshCombiner)mmb.meshCombiner;
            GameObject prefabRoot = mom.resultPrefab;
            GameObject rootGO = (GameObject)PrefabUtility.InstantiatePrefab(prefabRoot);
            for (int i = 0; i < mbs.meshCombiners.Count; i++)
            {
                SA3MeshCombinerSingle.BuildSceneHierarch(mbs.meshCombiners[i].combinedMesh, rootGO, mbs.meshCombiners[i].combinedMesh.GetMesh(), true);
            }
            string prefabPth = AssetDatabase.GetAssetPath(prefabRoot);
            PrefabUtility.ReplacePrefab(rootGO, AssetDatabase.LoadAssetAtPath(prefabPth, typeof(GameObject)), ReplacePrefabOptions.ConnectToPrefab);
            Editor.DestroyImmediate(rootGO);
        }
        else
        {
            Debug.LogError("Argument was not a SA3MeshCombine or an SA3MultiMeshCombine.");
        }
    }
}
