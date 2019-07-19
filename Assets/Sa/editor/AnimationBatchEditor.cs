using UnityEditor;
using UnityEngine;
using System.IO;
using System.Collections;
using System.Collections.Generic;

public class AnimationBatchEditor
{
	[MenuItem("SACU Editor/Kit/Animation Copy Batch")]
	static void Execute()
	{
		List<string> lstAnimName = new List<string>();
		
		foreach (Object o in Selection.GetFiltered(typeof(Object), SelectionMode.DeepAssets))
		{
			if (!(o is GameObject))
				continue;
			if (!o.name.Contains("@"))
				continue;
			
			GameObject charFbx = (GameObject)o;
			
			string strClipName = charFbx.name;
			int nIndex = strClipName.LastIndexOf('@');
			strClipName = strClipName.Substring(nIndex + 1, strClipName.Length - nIndex - 1);
			
			AnimationClip newClip = new AnimationClip();
			EditorUtility.CopySerialized(charFbx.GetComponent<Animation>().GetClip(strClipName), newClip);
			
			string strNewAnim = AssetDatabase.GetAssetPath(charFbx);
			strNewAnim = strNewAnim.Substring(0, strNewAnim.LastIndexOf('/') + 1);
			strNewAnim += strClipName;
			strNewAnim += ".anim";
			
			if(!File.Exists(strNewAnim))
				AssetDatabase.CreateAsset(newClip, strNewAnim);
			
			lstAnimName.Add(strClipName);
		}
		
		foreach (Object o in Selection.GetFiltered(typeof(Object), SelectionMode.DeepAssets))
		{
			if (!(o is GameObject))
				continue;
			if (o.name.Contains("@"))
				continue;
			
			GameObject charFbx = (GameObject)o;
			
			string CharDirPath = AssetDatabase.GetAssetPath(charFbx);
			CharDirPath = CharDirPath.Substring(0, CharDirPath.LastIndexOf('/') + 1);
			
			// 清空默认动作
			charFbx.GetComponent<Animation>().clip = null;
			
			foreach (string name in lstAnimName)
			{
				AnimationClip DestClip = (AnimationClip)AssetDatabase.LoadAssetAtPath(CharDirPath + name + ".anim", typeof(AnimationClip));
				charFbx.GetComponent<Animation>().RemoveClip(name);
				charFbx.GetComponent<Animation>().AddClip(DestClip, name);
			}
			
			// 重设默认动作
			AnimationClip defaultClip = charFbx.GetComponent<Animation>().GetClip("Idle1");
			if (defaultClip != null)
				charFbx.GetComponent<Animation>().clip = defaultClip;
			
			charFbx.GetComponent<Animation>().cullingType = AnimationCullingType.AlwaysAnimate;
			
			EditorUtility.SetDirty(o);
		}
	}
}