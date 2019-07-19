using System;
using UnityEditor;
using UnityEngine;
using System.Collections.Generic;
using System.IO;
using System.Xml;
using System.Text;

using Sacu.Events;
using Sacu.Utils;
using System.Reflection;
public partial class BuildPipelinePanel : EditorWindow
{
    private const string checkSymbol = @"●";
    private bool beAutoGen = false;
    GUILayoutOption[] opt = new GUILayoutOption[2]
    {
        GUILayout.Height(30),
        GUILayout.Width(140),
    };

    [MenuItem("SACU Editor/AssetBundle")]
    public static void OpenBuildPipelinePanel()
    {
        EditorWindow.GetWindow<BuildPipelinePanel>(false, "版本发布工具", true);
    }
    private void DrawDebugTool()
    {
        GUILayout.BeginHorizontal();
        GUILayout.BeginVertical(opt);
        if (GUILayout.Button("发布Lua文件", opt))
        {
            if (!StreamPack.PackStreamData())
            {
                EditorUtility.DisplayDialog("", "打包Lua失败", "OK");
            } else {
                EditorUtility.DisplayDialog("", "操作成功，请继续执行“发布资源文件”", "OK");
            }
        }
        if (GUILayout.Button("发布资源文件", opt))
        {
            PackageAssetBundle(currentBuildTarget);
            PackageShader(currentBuildTarget);
            EditorUtility.DisplayDialog("", "操作成功，请继续执行“生成更新检测文件”", "OK");
            return;
        }
        if (GUILayout.Button("生成更新检测文件", opt))
        {
            CreateMD5List.Execute(currentBuildTarget);
            EditorUtility.DisplayDialog("", "操作成功，请继续执行“效验更新检测文件”", "OK");
        }

        if (GUILayout.Button("效验更新检测文件", opt))
        {
            CampareMD5ToGenerateVersionNum.Execute(currentBuildTarget);
            EditorUtility.DisplayDialog("", "资源发布完成！", "OK");
        }

        GUILayout.Space(70f);
        if (GUILayout.Button("一键发布", opt))
        {
            if (StreamPack.PackStreamData() 
                && PackageAssetBundle(currentBuildTarget) && PackageShader(currentBuildTarget)
                && CreateMD5List.Execute(currentBuildTarget) && CampareMD5ToGenerateVersionNum.Execute(currentBuildTarget))
            {
                EditorUtility.DisplayDialog("", "一键发布完成！", "OK");
            } else
            {
                EditorUtility.DisplayDialog("", "一键发布失败！", "OK");
            }
        }
        GUILayout.EndHorizontal();
    }
    private void ReleaseFile(BuildTarget target, string fileName)
    {
        string path = Path.Combine(SAAppConfig.DevResDir, SAAppConfig.DataDir) + fileName;

        FileInfo fileInfo = new FileInfo(path);
        string AbsReleasePath = BuildPipelinePanel.GetPlatformAbsReleasePath(target);
        SALang.MakDirValid(AbsReleasePath);
        path = Path.Combine(AbsReleasePath, fileName);
        SALang.ForceDeleteFile(path);
        fileInfo.CopyTo(path);
    }

    public static bool PackageAssetBundle(BuildTarget buildTarget) {
        Caching.ClearCache();
        string[] dirs = new string[]{
            SAAppConfig.DataDir,//数据表
            //SAAppConfig.TextureDir,//图片
            //SAAppConfig.MaterialDir,//材质
            //SAAppConfig.PrefabFontAtlasDir,//字体
            SAAppConfig.ParticleDir,//粒子
            SAAppConfig.SoundDir,//音效
            SAAppConfig.PrefabAtlasDir,//图集
            SAAppConfig.ModelDir,//模型预置
            //SAAppConfig.FBXDir,//动作文件
            SAAppConfig.PrefabUIDir,//UI预置
            SAAppConfig.LuaByteDir//Lua
        };
        string[] extNames = new string[] {
            "*.*",//数据表
            //"*.png;*.jpg",//图片
            //"*.mat",//材质
            //"*.*",//字体
            "*.prefab",//粒子
            "*.prefab",//音效
            "*.prefab",//图集
            "*.prefab;",//模型预置
            //"*.prefab",//"*.FBX;*.fbx",//fbx动作文件
            "*.prefab",//UI预置
            "*.bytes" };//Lua
        return CreateAssetBundle.Execute(buildTarget, BuildAssetBundleOptions.DeterministicAssetBundle
        | BuildAssetBundleOptions.ChunkBasedCompression, "", dirs, extNames);
    }

    public static bool PackageShader(BuildTarget buildTarget)
    {
        Caching.ClearCache();
        string[] dirs = new string[]{
            //SAAppConfig.ShaderDir,//Shader
            SAAppConfig.MaterialDir//Shader
            
        };

        string[] extNames = new string[] { "*.mat" };//, "*.prefab" 
        return CreateAssetBundle.Execute(buildTarget, BuildAssetBundleOptions.DeterministicAssetBundle | BuildAssetBundleOptions.UncompressedAssetBundle, "s", dirs, extNames, true, "shader.sa");
    }
    public static string GetPlatformName(UnityEditor.BuildTarget target)
    {
        string platform = "Windows32";
        switch (target)
        {
            case BuildTarget.StandaloneWindows:
                platform = "Windows32";
                break;
            case BuildTarget.StandaloneWindows64:
                platform = "Windows64";
                break;
            case BuildTarget.iOS:
                platform = "IOS";
                break;
            case BuildTarget.StandaloneOSX:
                platform = "Mac";
                break;
            case BuildTarget.Android:
                platform = "Android";
                break;
            default:
                break;
        }
        return platform;
    }

    public static string GetPlatformReleasePath(UnityEditor.BuildTarget target)
    {
        return GetPlatformReleasePath(target, "");
    }
    public static string GetPlatformReleasePath(UnityEditor.BuildTarget target, string ext)
    {
        return Path.Combine(SAAppConfig.LocalReleasePath, SAAppConfig.Language + GetPlatformName(target) + ext);
    }
    public static string GetPlatformAbsReleasePath(UnityEditor.BuildTarget target)
    {
        return GetPlatformAbsReleasePath(target, "");
    }
    public static string GetPlatformAbsReleasePath(UnityEditor.BuildTarget target, string ext) { 
        return Path.Combine(SAAppConfig.ReleasePath, SAAppConfig.Language + GetPlatformName(target) + ext);
    }
    
    private void GenLuaBinder()
    {
        StringBuilder sb = new StringBuilder();
        sb.AppendLine("using System;");
        sb.AppendLine("using System.Collections.Generic;");
        sb.AppendLine();
        sb.AppendLine("public static class LuaBinder");
        sb.AppendLine("{");
        sb.AppendLine("\tpublic static List<string> wrapList = new List<string>();");
        sb.AppendLine("\tpublic static void Bind(IntPtr L, string type = null)");
        sb.AppendLine("\t{");
        sb.AppendLine("\t\tif (type == null || wrapList.Contains(type)) return;");
        sb.AppendLine("\t\twrapList.Add(type); type += \"Wrap\";");
        sb.AppendLine("\t\tswitch (type) {");
        string[] files = Directory.GetFiles("Assets/uLua/Source/LuaWrap/", "*.cs", SearchOption.TopDirectoryOnly);

        List<string> wrapfiles = new List<string>();
        for (int i = 0; i < files.Length; i++)
        {
            string wrapName = Path.GetFileName(files[i]);
            int pos = wrapName.LastIndexOf(".");
            wrapName = wrapName.Substring(0, pos);
            sb.AppendFormat("\t\t\tcase \"{0}\": {0}.Register(L); break;\r\n", wrapName);

            string wrapfile = wrapName.Substring(0, wrapName.Length - 4);
            wrapfiles.Add("import '" + wrapfile + "'");
        }
        if (SAAppConfig.AutoWrapMode)
        {
            string wrapfile = SAAppConfig.DevLuaDir + "System/Wrap.lua";
            File.WriteAllLines(wrapfile, wrapfiles.ToArray());
        }
        sb.AppendLine("\t\t}");
        sb.AppendLine("\t}");
        sb.AppendLine("}");

        string file = SAAppConfig.LuaBasePath + "Base/LuaBinder.cs";

        using (StreamWriter textWriter = new StreamWriter(file, false, Encoding.UTF8))
        {
            textWriter.Write(sb.ToString());
            textWriter.Flush();
            textWriter.Close();
        }
    }
}

public class BindType
{
    public string name;                 //类名称
    public Type type;
    public bool IsStatic;
    public string baseName = null;      //继承的类名字
    public string wrapName = "";        //产生的wrap文件名字
    public string libName = "";         //注册到lua的名字
    

    public BindType SetBaseName(string str)
    {
        baseName = str;
        return this;
    }

    public BindType SetWrapName(string str)
    {
        wrapName = str;
        return this;
    }

    public BindType SetLibName(string str)
    {
        libName = str;
        return this;
    }
}
