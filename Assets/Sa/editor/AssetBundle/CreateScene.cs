using UnityEngine;
using UnityEditor;
using System.Collections;

public class CreateScene {

	public static void Execute(UnityEditor.BuildTarget target)
	{
        string SavePath = BuildPipelinePanel.GetPlatformReleasePath(target);
		
		// 当前选中的资源列表
		foreach (Object o in Selection.GetFiltered(typeof(Object), SelectionMode.DeepAssets)) {
			string path = AssetDatabase.GetAssetPath (o);
			//string [] levels = {path};
			
			// 过滤掉meta文件和文件夹
			if (path.Contains (".meta") || path.Contains (".") == false)
				continue;
			
			// 过滤掉UIAtlas目录下的贴图和材质(UI/Common目录下的所有资源都是UIAtlas)
			if (path.Contains ("UI/Common")) {
				if ((o is Texture) || (o is Material))
					continue;
			}
			
			path = SavePath + ConvertToAssetBundleName (path);
			path = path.Substring (0, path.LastIndexOf ('.'));
			path += ".assetbundle";

			//打包场景
			//BuildPipeline.BuildStreamedSceneAssetBundle (levels, path, target, BuildOptions.UncompressedAssetBundle);
		}
		// scene目录下的资源
		AssetDatabase.Refresh ();

	}
	static string ConvertToAssetBundleName(string ResName)
	{
		return ResName.Replace('/', '.');
	}
}
