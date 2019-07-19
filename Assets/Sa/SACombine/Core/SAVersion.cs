using UnityEngine;
using System.Collections;
using System;
using SA.Core;
public class SAVersion {
    private static SAVersionInterface _SAVersion;

    public static string version()
    {
        if (_SAVersion == null) _SAVersion = (SAVersionInterface)Activator.CreateInstance(Type.GetType("SA.Core.SAVersionConcrete,Assembly-CSharp"));
        return _SAVersion.version();
    }

    public static int GetMajorVersion()
    {
        if (_SAVersion == null) _SAVersion = (SAVersionInterface)Activator.CreateInstance(Type.GetType("SA.Core.SAVersionConcrete,Assembly-CSharp"));
        return _SAVersion.GetMajorVersion();
    }

    public static int GetMinorVersion()
    {
        if (_SAVersion == null) _SAVersion = (SAVersionInterface)Activator.CreateInstance(Type.GetType("SA.Core.SAVersionConcrete,Assembly-CSharp"));
        return _SAVersion.GetMinorVersion();
    }

    public static bool GetActive(GameObject go)
    {
        if (_SAVersion == null) _SAVersion = (SAVersionInterface)Activator.CreateInstance(Type.GetType("SA.Core.SAVersionConcrete,Assembly-CSharp"));
        return _SAVersion.GetActive(go);
    }

    public static void SetActive(GameObject go, bool isActive)
    {
        if (_SAVersion == null) _SAVersion = (SAVersionInterface)Activator.CreateInstance(Type.GetType("SA.Core.SAVersionConcrete,Assembly-CSharp"));
        _SAVersion.SetActive(go, isActive);
    }

    public static void SetActiveRecursively(GameObject go, bool isActive)
    {
        if (_SAVersion == null) _SAVersion = (SAVersionInterface)Activator.CreateInstance(Type.GetType("SA.Core.SAVersionConcrete,Assembly-CSharp"));
        _SAVersion.SetActiveRecursively(go, isActive);
    }

    public static UnityEngine.Object[] FindSceneObjectsOfType(Type t)
    {
        if (_SAVersion == null) _SAVersion = (SAVersionInterface)Activator.CreateInstance(Type.GetType("SA.Core.SAVersionConcrete,Assembly-CSharp"));
        return _SAVersion.FindSceneObjectsOfType(t);
    }

    public static bool IsRunningAndMeshNotReadWriteable(Mesh m)
    {
        if (_SAVersion == null) _SAVersion = (SAVersionInterface)Activator.CreateInstance(Type.GetType("SA.Core.SAVersionConcrete,Assembly-CSharp"));
        return _SAVersion.IsRunningAndMeshNotReadWriteable(m);
    }

    public static Vector2[] GetMeshUV1s(Mesh m, SA2LogLevel LOG_LEVEL)
    {
        if (_SAVersion == null) _SAVersion = (SAVersionInterface)Activator.CreateInstance(Type.GetType("SA.Core.SAVersionConcrete,Assembly-CSharp"));
        return _SAVersion.GetMeshUV1s(m, LOG_LEVEL);
    }

    public static void MeshClear(Mesh m, bool t)
    {
        if (_SAVersion == null) _SAVersion = (SAVersionInterface)Activator.CreateInstance(Type.GetType("SA.Core.SAVersionConcrete,Assembly-CSharp"));
        _SAVersion.MeshClear(m, t);
    }

    public static void MeshAssignUV1(Mesh m, Vector2[] uv1s)
    {
        if (_SAVersion == null) _SAVersion = (SAVersionInterface)Activator.CreateInstance(Type.GetType("SA.Core.SAVersionConcrete,Assembly-CSharp"));
        _SAVersion.MeshAssignUV1(m, uv1s);
    }

    public static Vector3 GetLightmapTilingOffset(Renderer r)
    {
        if (_SAVersion == null) _SAVersion = (SAVersionInterface)Activator.CreateInstance(Type.GetType("SA.Core.SAVersionConcrete,Assembly-CSharp"));
        return _SAVersion.GetLightmapTilingOffset(r);
    }

    public static Transform[] GetBones(Renderer r)
    {
        if (_SAVersion == null) _SAVersion = (SAVersionInterface)Activator.CreateInstance(Type.GetType("SA.Core.SAVersionConcrete,Assembly-CSharp"));
        return _SAVersion.GetBones(r);
    }
}
