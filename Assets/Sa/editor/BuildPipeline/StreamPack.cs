using System;
using System.IO;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

using Sacu.Utils;
public static class StreamPack
{
    static private bool _PackStreamDatas(string ext, int encrypt)
    {


		string outputFilename = SALang.NormalizePath(Path.Combine(SAAppConfig.DevResDir, SAAppConfig.LuaByteDir));
        string inputDir = SALang.NormalizePath(SAAppConfig.DevLuaDir);
        
        List<string> extNames = new List<string>();
        extNames.AddRange(ext.Split(';'));
		Debug.Log ("_PackStreamDatas");
        return VfsPack.PackFile(outputFilename, inputDir, extNames, encrypt) > 0;
    }
    static private bool _PackStreamFiles()
    {
        bool succ = true;
        //succ = succ && _PackStreamDatas(SAAppConfig.DATA_DIR, "SceneSource", "SceneSource", ".xml", 1);
		succ = succ && _PackStreamDatas(".lua", 1);
        return succ;
    }
    
    private static void CopyFolder(string source, string target)
    {
        SALang.MakDirValid(target);
        
        DirectoryInfo direcInfo = new DirectoryInfo(source);
        FileInfo[] files = direcInfo.GetFiles();
        
        foreach (FileInfo file in files)
        {
            string filename = Path.Combine(target, file.Name);
            FileInfo fi = file.CopyTo(filename, true);
            fi.Attributes = FileAttributes.Normal;
        }
        
        DirectoryInfo[] direcInfoArr = direcInfo.GetDirectories();
        foreach (DirectoryInfo dir in direcInfoArr)
        {
            CopyFolder(Path.Combine(source, dir.Name), Path.Combine(target, dir.Name));
        }        
    }

    public static bool PackStreamData()
    {
        //if (!LuaCompileTool.CompileAllLuaScript())
        //{
        //    Debug.LogError(string.Format("BuildReleaseData : LuaCompileTool.CompileAllLuaScript Fail!"));
        //    return false;
        //}
        
        if (!_PackStreamFiles())
        {
            Debug.LogError(string.Format("BuildReleaseData : PackAssetStreamingFiles Fail!"));
            return false;
        }
        
        if (!LuaCompileTool.DeleteScriptTmpDir())
        {
            return false;
        }
        
        AssetDatabase.Refresh();
        
        return true;
    }

 
    public static bool DelDir(string dst)
    {
        if (Directory.Exists(dst))
        {
            try
            {
                string[] files = Directory.GetFiles(dst, "*.*", SearchOption.AllDirectories);
                foreach (string filename in files)
                {
                    File.SetAttributes(filename, FileAttributes.Normal);
                    File.Delete(filename);
                }
				
                System.IO.Directory.Delete(dst, true);
            } catch (Exception e)
            {
                Debug.LogError("Del Fail:" + e.ToString());
                return false;
            }
        }

        return true;
    }
}

