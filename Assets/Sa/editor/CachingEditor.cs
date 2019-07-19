using UnityEngine;
using UnityEditor;
using System.Collections;

public class CachingEditor : EditorWindow
{
	static CachingEditor frame;

    [MenuItem("SACU Editor/Kit/Caching Info")]
	static void Execute()
	{
		if (frame == null)
		{
			frame = (CachingEditor)GetWindow(typeof(CachingEditor));
		}
		frame.Show();
	}
	
	string url = "";
	string version = "";
	bool exist = false;
	
	void OnGUI()
	{
		// 信息显示区域
		GUI.BeginGroup(new Rect(10f, 10f, 280f, 250f), "", "box");
		EditorGUILayout.BeginVertical();
		
		GUILayout.Label("是否激活: " + Caching.compressionEnabled);
		GUILayout.Label("是否准备好: " + Caching.ready);
		GUILayout.Label("缓存总容量: " + Caching.maximumAvailableDiskSpace / (1024f * 1024f) + "M");
		GUILayout.Label("已使用: " + Caching.spaceOccupied / (1024f * 1024f) + "M");
		GUILayout.Label("还剩余: " + Caching.spaceFree / (1024f * 1024f) + "M");
		GUILayout.Label("空闲剩余时间: " + (Caching.expirationDelay / 3600f) + "h");
		
		// 特定资源检索
		GUILayout.Label("------------------------------------------------");
		GUILayout.Label("URL");
		url = EditorGUILayout.TextField(url, GUILayout.Width(200), GUILayout.Height(20));
		GUILayout.Label("VersionNum");
		version = EditorGUILayout.TextField(version, GUILayout.Width(200), GUILayout.Height(20));
		if (GUI.Button(new Rect(210f, 150f, 50f, 50f), "检测"))
		{
			exist = Caching.IsVersionCached(url, System.Convert.ToInt32(version));
		}
		GUI.Label(new Rect(0, 210, 200, 20), "该资源是否存在: " + exist);
		GUI.Label(new Rect(0, 230, 300, 20), "------------------------------------------------");
		
		EditorGUILayout.EndVertical();
		GUI.EndGroup();
		
		if (GUI.Button(new Rect(10, 280f, 280f, 50f), "清空缓存"))
		{
			Caching.ClearCache();
		}
		
	}
	
}