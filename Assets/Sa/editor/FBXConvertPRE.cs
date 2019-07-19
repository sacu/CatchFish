using System.IO;
using UnityEditor;
using UnityEditor.Animations;
using UnityEngine;

public class FBXConvertPRE : AssetPostprocessor
{
    //Choose Folder in Project -> Get all Fbxs -> Get the clip to make a AnimatorController -> Create a Prefab and bind the AnimatorController

    [MenuItem("Tools/Create Prefab and AnimatorController")]
    public static void Create()
    {
        Object[] objects = Selection.objects;
        int len = objects.Length;
        if (len == 0)
        {
            Debug.Log("请选中Project视图的文件夹进行预制件和动画控制器的生成！");
        }

        for (int i = 0; i < len; i++)
        {
            string resPath = Application.dataPath.Substring(0, Application.dataPath.LastIndexOf('/')) + "/" + AssetDatabase.GetAssetPath(objects[i]);
            DirectoryInfo directoryInfo = new DirectoryInfo(resPath);

            SearchAllFbx(directoryInfo);
        }

        AssetDatabase.Refresh();
    }

    /// <summary>
    /// 搜索所有的fbx文件
    /// </summary>
    /// <param name="directoryInfo"></param>
    private static void SearchAllFbx(DirectoryInfo directoryInfo)
    {
        FileInfo[] fileInfos = directoryInfo.GetFiles();
        foreach (FileInfo fileInfo in fileInfos)
        {
            if (fileInfo.Extension != ".meta")
            {
                int index = fileInfo.FullName.IndexOf("Assets");
                string path = fileInfo.FullName.Substring(index);

                Object obj = AssetDatabase.LoadAssetAtPath(path, typeof(GameObject));
                bool performOnce = true;
                string prefabPath = "";
                string animatorControllerPath = "";
                if (obj != null && !obj.name.EndsWith(".meta"))
                {
                    if (performOnce)
                    {
                        prefabPath = GetHigherFolderPath(fileInfo) + "Prefabs";
                        animatorControllerPath = GetHigherFolderPath(fileInfo) + "AnimatorControllers";
                        CreateFolder(prefabPath);
                        CreateFolder(animatorControllerPath);
                        performOnce = false;
                    }

                    GameObject prefab = CreatePrefab(obj, prefabPath);
                    AnimatorController controller = CreateAnimatorController(obj, animatorControllerPath);
                    prefab.GetComponent<Animator>().runtimeAnimatorController = controller;
                }
            }
        }
        if (directoryInfo.Exists)
        {
            DirectoryInfo[] directoryInfos = directoryInfo.GetDirectories();
            foreach (DirectoryInfo dir in directoryInfos)
            {
                SearchAllFbx(dir);
            }
        }
    }

    /// <summary>
    /// 获取当前文件的上一级文件夹路径
    /// </summary>
    /// <param name="fileInfo"></param>
    private static string GetHigherFolderPath(FileInfo fileInfo)
    {
        string[] dirNames = fileInfo.DirectoryName.Split('\\');
        string path = string.Empty;
        for (int i = 0; i < dirNames.Length - 1; i++)
        {
            path += dirNames[i] + "/";
        }
        path = path.Substring(path.IndexOf("Assets"));
        return path;
    }

    /// <summary>
    /// 创建文件夹
    /// </summary>
    /// <param name="path"></param>
    private static void CreateFolder(string path)
    {
        if (!Directory.Exists(path))
        {
            Directory.CreateDirectory(path);
        }
    }

    /// <summary>
    /// 创建预制体
    /// </summary>
    /// <param name="obj"></param>
    /// <param name="path"></param>
    /// <returns></returns>
    private static GameObject CreatePrefab(Object obj, string path)
    {
        GameObject prefab = PrefabUtility.CreatePrefab(path + "/" + obj.name + ".prefab", obj as GameObject);
        return prefab;
    }

    /// <summary>
    /// 创建动画控制器
    /// </summary>
    /// <param name="obj"></param>
    /// <param name="path"></param>
    /// <returns></returns>
    private static AnimatorController CreateAnimatorController(Object obj, string path)
    {
        string assetPath = AssetDatabase.GetAssetPath(obj);
        AnimationClip animationClip = AssetDatabase.LoadAssetAtPath<AnimationClip>(assetPath);

        AnimatorController animatorController = AnimatorController.CreateAnimatorControllerAtPath(path + "/" + obj.name + ".controller");
        animatorController.AddParameter("isLoop", AnimatorControllerParameterType.Bool);

        AnimatorControllerLayer animatorControllerLayer = animatorController.layers[0];
        AnimatorStateMachine animatorStateMachine = animatorControllerLayer.stateMachine;

        AnimatorState animatorState = animatorStateMachine.AddState(animationClip.name);
        animatorState.motion = animationClip;

        AnimatorState emptyState = animatorStateMachine.AddState("Empty", new Vector3(animatorStateMachine.entryPosition.x + 400,
            animatorStateMachine.entryPosition.y + 400, 0));

        AnimatorStateTransition animatorStateTransition = animatorState.AddTransition(emptyState);
        animatorStateTransition.hasExitTime = true;

        animatorStateTransition = emptyState.AddTransition(animatorState);
        animatorStateTransition.AddCondition(AnimatorConditionMode.If, 1, "isLoop");

        return animatorController;
    }
}