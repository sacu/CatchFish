using UnityEngine;
using System;
using System.Collections;

public class SAVersionEditor : MonoBehaviour {
    private static SAVersionEditorInterface _MBVersion;

    public static string GetPlatformString()
    {
        if (_MBVersion == null) _MBVersion = (SAVersionEditorInterface)Activator.CreateInstance(Type.GetType("SA.Core.SAVersionEditorConcrete,Assembly-CSharp-Editor"));
        return _MBVersion.GetPlatformString();
    }

    public static int GetMaximumAtlasDimension()
    {
        if (_MBVersion == null) _MBVersion = (SAVersionEditorInterface)Activator.CreateInstance(Type.GetType("SA.Core.SAVersionEditorConcrete,Assembly-CSharp-Editor"));
        return _MBVersion.GetMaximumAtlasDimension();
    }
}
