using UnityEngine;
using SA.Core;

public interface SAVersionInterface
{
    string version();
    int GetMajorVersion();
    int GetMinorVersion();
    bool GetActive(GameObject go);
    void SetActive(GameObject go, bool isActive);
    void SetActiveRecursively(GameObject go, bool isActive);
    UnityEngine.Object[] FindSceneObjectsOfType(System.Type t);
    bool IsRunningAndMeshNotReadWriteable(Mesh m);
    Vector2[] GetMeshUV1s(Mesh m, SA2LogLevel LOG_LEVEL);
    void MeshClear(Mesh m, bool t);
    void MeshAssignUV1(Mesh m, Vector2[] uv1s);
    Vector3 GetLightmapTilingOffset(Renderer r);
    Transform[] GetBones(Renderer r);
}
