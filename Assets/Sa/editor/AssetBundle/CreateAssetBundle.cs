using UnityEditor;
using UnityEngine;
using System.IO;
using System.Collections;
using System.Collections.Generic;

using Sacu.Utils;
public class CreateAssetBundle
{
    //|BuildAssetBundleOptions.UncompressedAssetBundle;
    //        = BuildAssetBundleOptions.UncompressedAssetBundle
    //        | BuildAssetBundleOptions.CollectDependencies;
    public static bool Execute(UnityEditor.BuildTarget target, BuildAssetBundleOptions bbo, string ext, string[] dirs, string[] extNames)
    {
        return Execute(target, bbo, ext, dirs, extNames, false, "");
    }
    public static bool Execute(UnityEditor.BuildTarget target, BuildAssetBundleOptions bbo, string ext, string[] dirs, string[] extNames, bool fixedAssetName, string assetName)
    {
        string ReleasePath =    BuildPipelinePanel.GetPlatformReleasePath(target, ext);//相对路径
        string AbsReleasePath = BuildPipelinePanel.GetPlatformAbsReleasePath(target, ext);//绝对路径
        SALang.MakDirValid(AbsReleasePath);
        string rootDir = SALang.NormalizePath(SAAppConfig.DevResDir);// 根目录
        int dirLen = dirs.Length;
        int fileLen;
        int i = 0, j;
        string searchDir;
        string[] filePaths;
        List<string> files;
        string[] resourcesAssets;
        List<AssetBundleBuild> abbs = new List<AssetBundleBuild>();
        AssetBundleBuild abb;
        string assetsFullPath;

        for (; i < dirLen; ++i)
        {
            searchDir = Path.Combine(rootDir, dirs[i]);
            filePaths = SALang.GetFileList(searchDir, extNames[i], true);
            if (null == filePaths || filePaths.Length == 0)
            {
                Debug.Log(string.Format("目录{0}没有需要打包的文件...", searchDir));
                continue;
            }
            files = new List<string>();
            files.AddRange(filePaths);

            fileLen = filePaths.Length;
            int languageDot;
            //所有文件
            for (j = 0; j < fileLen; ++j)
            {
                string filename = SALang.NormalizePath(filePaths[j]);//绝对路径
                if (filename.Substring(filename.LastIndexOf(".") + 1).Equals("meta"))//验证后缀
                {
                    continue;
                }
                assetsFullPath = filename.Replace(SAAppConfig.DevResDir, "");//转换为相对路径
                filename = ConvertToAssetBundleName(assetsFullPath).ToLower();//转换为
                
                languageDot = filename.LastIndexOf(".", filename.LastIndexOf(".") - 1);
                string language = filename.Substring(languageDot + 1, SAAppConfig.Language.Length);
                if (!language.Equals(SAAppConfig.Language))
                {
                    continue;
                }
                if (dirs[i].Equals(SAAppConfig.LuaByteDir) || dirs[i].Equals(SAAppConfig.DataDir))
                {
                    filename = filename.Substring(filename.IndexOf(".") + 1);
                    assetsFullPath = Path.Combine(AbsReleasePath, filename);
                    FileInfo fileInfo = new FileInfo(filePaths[j]);
                    SALang.ForceDeleteFile(assetsFullPath);
                    fileInfo.CopyTo(assetsFullPath, false);
                }
                else
                {
                    //filename += ".sa";
                    resourcesAssets = new string[1];
                    resourcesAssets[0] = Path.Combine(SAAppConfig.LocalDevDir, assetsFullPath);
                    DoSetAssetBundleName(filePaths[j] + ".meta", filename);
                    abb = new AssetBundleBuild();
                    abb.assetBundleName = fixedAssetName ? assetName : filename;
                    abb.assetNames = resourcesAssets;
                    abbs.Add(abb);
                }
            }
        }
        BuildPipeline.BuildAssetBundles(ReleasePath, abbs.ToArray(), bbo, target);
        AssetDatabase.Refresh();
        return true;
    }
    static void DoSetAssetBundleName(string path, string name)
    {
        StreamReader fs = new StreamReader(path);
        List<string> ret = new List<string>();
        string line;
        while ((line = fs.ReadLine()) != null)
        {
            line = line.Replace("\n", "");
            if (line.IndexOf("assetBundleName:") != -1)
            {
                line = "  assetBundleName: " + name;

            }
            ret.Add(line);
        }
        fs.Close();

        File.Delete(path);

        StreamWriter writer = new StreamWriter(path + ".tmp");
        foreach (var each in ret)
        {
            writer.WriteLine(each);
        }
        writer.Close();

        File.Copy(path + ".tmp", path);
        File.Delete(path + ".tmp");
    }
    private static void CopyFile(DirectoryInfo path, string desPath)
    {
        string sourcePath = path.FullName;
        System.IO.FileInfo[] files = path.GetFiles();
        foreach (System.IO.FileInfo file in files)
        {
            string sourceFileFullName = file.FullName;
            string destFileFullName = sourceFileFullName.Replace(sourcePath, desPath);
            file.CopyTo(destFileFullName, true);
        }
    }
	static string ConvertToAssetBundleName(string ResName)
	{
		return ResName.Replace('/', '.');
	}
}