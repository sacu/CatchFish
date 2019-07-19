using UnityEngine;
using System.Collections;
using SA.Core;

public class SA3MultiMeshCombine : SA3MeshCombineCommon
{
    [SerializeField]
    protected SA3MultiMeshCombiner _meshCombiner = new SA3MultiMeshCombiner();

    public override SA3MeshCombiner meshCombiner
    {
        get { return _meshCombiner; }
    }

    public override bool AddDeleteGameObjects(GameObject[] gos, GameObject[] deleteGOs, bool disableRendererInSource)
    {
        if (_meshCombiner.resultSceneObject == null)
        {
            _meshCombiner.resultSceneObject = new GameObject("SAMOBJsMesh-" + name);
        }
        meshCombiner.name = name + "-mesh";
        return _meshCombiner.AddDeleteGameObjects(gos, deleteGOs, disableRendererInSource);
    }

    public override bool AddDeleteGameObjectsByID(GameObject[] gos, int[] deleteGOs, bool disableRendererInSource)
    {
        if (_meshCombiner.resultSceneObject == null)
        {
            _meshCombiner.resultSceneObject = new GameObject("SAMByIDMesh-" + name);
        }
        meshCombiner.name = name + "-mesh";
        return _meshCombiner.AddDeleteGameObjectsByID(gos, deleteGOs, disableRendererInSource);
    }
}
