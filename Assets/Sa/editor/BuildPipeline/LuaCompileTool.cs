//#define COMPILE_LUA_EXTERNAL

using UnityEditor;
using UnityEngine;

using System;
using System.IO;
using System.Text;

using Sacu.Utils;

public static class LuaCompileTool
{
#if COMPILE_LUA_EXTERNAL
    static string luajitcmd = string.Empty;
    static string luajitDir = string.Empty;
#else
    static int totalLuaCount = 0;
#endif
    
#if !COMPILE_LUA_EXTERNAL
    static bool _compileSingleLua(string dst, string src)
    {
        ++totalLuaCount;
        
        string data     = File.ReadAllText(src, System.Text.Encoding.UTF8);
        
        return false;
    }
    
    static bool CompileLuaDirectory(string dst, string src)
    {
        string[] fileEntries = Directory.GetFiles(src);
        foreach (string srcFile in fileEntries)
        {
            if (Path.GetExtension(srcFile).ToLower() != ".lua")
            {
                continue;
            }
            
            string name     = Path.GetFileName(srcFile);
            string dstFile  = Path.Combine(dst, name);
            
            if (!_compileSingleLua(dstFile, srcFile))
            {
                Debug.LogError(string.Format("Compile lua fail: src={0} dst={1}", srcFile, dstFile));
                return false;
            }
        }
        
        string[] dirs = Directory.GetDirectories(src);
        foreach (string dir in dirs)
        {
            string name = Path.GetFileNameWithoutExtension(dir);
            string dstChild = Path.Combine(dst, name);
            Directory.CreateDirectory(dstChild);
            
            if (!CompileLuaDirectory(dstChild, dir))
            {
                return false;
            }
        }
        
        return true;
    }
#endif
    
#if COMPILE_LUA_EXTERNAL
    static bool CompileAllLuaByTool(string dst, string src)
    {
        Debug.Log(string.Format("使用批量Luajit字节码工具:{0}", luajitcmd));
    
        dst = Normalize(dst);
        src = Normalize(src);
        
        string arg = string.Format("{0} {1}", src, dst);
        
        System.Diagnostics.ProcessStartInfo info = new System.Diagnostics.ProcessStartInfo();
        info.FileName = luajitcmd;
        info.WorkingDirectory = luajitDir;
        info.RedirectStandardOutput = true;
        info.RedirectStandardError = true;
        info.Arguments = arg;
        info.UseShellExecute = false;
        info.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
        
        System.Diagnostics.Process task = null;
        
        bool rt = true;
        
        try
        {
            task = System.Diagnostics.Process.Start(info);
            if (task != null)
            {
                task.WaitForExit(10000);
            } 
            else
            {
                return false;
            }
        } 
        catch (Exception e)
        {
            Debug.LogError("CompileAllLuaByTool: " + e.ToString());
            return false;
        } 
        finally
        {
            if (task != null && task.HasExited)
            {
                string output = task.StandardError.ReadToEnd();
                if (output.Length > 0)
                {
                    Debug.LogError(output);
                }
                
                output = task.StandardOutput.ReadToEnd();
                if (output.Length > 0)
                {
                    Debug.Log("CompileAllLuaByTool: " + output);
                }
                
                rt = (task.ExitCode == 0);
            }
        }
        
        return rt;
    }
#endif
    
    private static void CopyDirectoryBinary(string srcDir, string tgtDir, string extName)
    { 
        DirectoryInfo source = new DirectoryInfo(srcDir); 
        DirectoryInfo target = new DirectoryInfo(tgtDir); 
        
        if (target.FullName.StartsWith(source.FullName, StringComparison.CurrentCultureIgnoreCase))
        { 
            return;
        } 
        
        if (!source.Exists)
        { 
            return; 
        } 
        
        if (!target.Exists)
        { 
            target.Create(); 
        } 
        
        FileInfo[] files = source.GetFiles(); 
        
        for (int i = 0; i < files.Length; i++)
        { 
            if (extName.Length > 0 && Path.GetExtension(files [i].FullName).ToLower() != extName)
            {
                continue;
            }
            
            string dstName = target.FullName + @"/" + files [i].Name;
            
            //File.Copy(files[i].FullName, dstName, true);
            
            string src = File.ReadAllText(files[i].FullName, Encoding.UTF8);
            File.Delete(dstName);
            File.WriteAllBytes(dstName, Encoding.UTF8.GetBytes(src));
            
            FileInfo fi = new FileInfo(dstName);
            fi.Attributes = FileAttributes.Normal;
        } 
        
        DirectoryInfo[] dirs = source.GetDirectories(); 
        
        for (int i = 0; i < dirs.Length; i++)
        { 
            CopyDirectoryBinary(dirs [i].FullName, target.FullName + @"/" + dirs [i].Name, extName); 
        } 
    }
    
    public static bool DeleteScriptTmpDir()
    {
        string dst = Path.Combine(SAAppConfig.ReleasePath, SAAppConfig.TempLuaDir);
		return StreamPack.DelDir(dst);
    }
}
