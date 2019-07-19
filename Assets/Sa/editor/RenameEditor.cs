using UnityEditor;
using UnityEngine;
using System.IO;
using System.Collections;
using System.Collections.Generic;

public class RenameEditor
{
    private const string rename = "XX-";
    [MenuItem("SACU Editor/Kit/File Rename")]
	private static void Execute()
	{
		foreach (Object o in Selection.GetFiltered(typeof(Object), SelectionMode.DeepAssets))
		{
			if (!(o is Object))
				continue;
			AssetDatabase.RenameAsset(AssetDatabase.GetAssetPath(o), rename + o.name);
		}
	}
}