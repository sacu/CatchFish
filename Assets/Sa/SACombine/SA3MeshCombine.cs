using UnityEngine;
using System.Collections;
using SA.Core;
public class SA3MeshCombine : SA3MeshCombineCommon
{

    [SerializeField]
    protected SA3MeshCombinerSingle _meshCombiner = new SA3MeshCombinerSingle();

    public override SA3MeshCombiner meshCombiner
    {
        get { return _meshCombiner; }
    }

    public void BuildSceneMeshObject()
    {
        _meshCombiner.BuildSceneMeshObject();
    }

    public virtual bool ShowHide(GameObject[] gos, GameObject[] deleteGOs)
    {
        return _meshCombiner.ShowHideGameObjects(gos, deleteGOs);
    }

    public virtual void ApplyShowHide()
    {
        _meshCombiner.ApplyShowHide();
    }

    public override bool AddDeleteGameObjects(GameObject[] gos, GameObject[] deleteGOs, bool disableRendererInSource)
    {
        //		if ((_meshCombiner.outputOption == SA2OutputOptions.bakeIntoSceneObject || (_meshCombiner.outputOption == SA2OutputOptions.bakeIntoPrefab && _meshCombiner.renderType == SARenderType.skinnedMeshRenderer) )) BuildSceneMeshObject();
        _meshCombiner.name = name + "-mesh";
        return _meshCombiner.AddDeleteGameObjects(gos, deleteGOs, disableRendererInSource);
    }

    public override bool AddDeleteGameObjectsByID(GameObject[] gos, int[] deleteGOinstanceIDs, bool disableRendererInSource)
    {
        //		if ((_meshCombiner.outputOption == SA2OutputOptions.bakeIntoSceneObject || (_meshCombiner.outputOption == SA2OutputOptions.bakeIntoPrefab && _meshCombiner.renderType == SARenderType.skinnedMeshRenderer) )) BuildSceneMeshObject();
        _meshCombiner.name = name + "-mesh";
        return _meshCombiner.AddDeleteGameObjectsByID(gos, deleteGOinstanceIDs, disableRendererInSource);
    }
}
