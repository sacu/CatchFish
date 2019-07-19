using System;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEditor;
using System.Text;

using Sacu.Utils;
public struct VfsPackNode
{
    public VfsPackNode(string absolutePath, string relativePath, long size)
    {
        this.absolutePath = absolutePath;
        this.relativePath = relativePath;
        this.size = size;
    }

    public string absolutePath;
    public string relativePath;
    public long size;
}

public sealed class VfsPack
{
    public static void FindFiles(string sourceDir, List<string> extNames, ref List<VfsPackNode> output)
    {
		string [] files = Directory.GetFiles(sourceDir);
        foreach (string filename in files)
        {
            string ext = Path.GetExtension(filename).ToLower();
            if (!extNames.Contains(ext))
            {
                continue;
            }
            string newFilename = SALang.NormalizePath(filename);
            FileInfo fi = new FileInfo(newFilename);
            string relativePath = newFilename.Substring(newFilename.IndexOf(SAAppConfig.LuaDir));
            output.Add(new VfsPackNode(newFilename, relativePath, fi.Length));
        }
		
        string[] dirs = Directory.GetDirectories(sourceDir);
        foreach (string dir in dirs)
        {
            string subDir = SALang.NormalizePath(Path.Combine(sourceDir, dir));
            FindFiles(subDir, extNames, ref output);
        }
    }

    public static byte[] ReadFileToBuff(string path)
    {
        FileStream fileStream = File.OpenRead(path);
        byte[] buff = new byte[fileStream.Length];
        fileStream.Read(buff, 0, buff.Length);
        fileStream.Close();
        return buff;
    }
	
    // [count] 
    // 	    [path_length][path] [file_size][file]
    //	    [path_length][path] [file_size][file]
    public static int PackFile(string outputFilename, string inputDir, List<string> extNames, int encrypt)
    {
		List<VfsPackNode> nodes = new List<VfsPackNode>();
        if (!Directory.Exists(inputDir))
        {
            Debug.LogWarning(string.Format("Pack Directory {0} not exists!", inputDir));
            return 0;
		}
        FindFiles(inputDir, extNames, ref nodes);
        if (nodes.Count == 0)
        {
            Debug.LogWarning(string.Format("Pack Directory {0} Fail, File=0!", inputDir));
            return 0;
        }

		string lastPath = Path.Combine (outputFilename, SAAppConfig.LuaPathName);
		Debug.Log (lastPath);
        // del old file.
		SALang.ForceDeleteFile(lastPath);
		SALang.MakDirValid (outputFilename);
		FileStream outputHandle = File.Create(lastPath);
        if (outputHandle == null)
        {
			Debug.LogWarning(string.Format("Write File {0} Fail!", lastPath));
            return 0;
        }

        BinaryWriter writer = new BinaryWriter(outputHandle);

        // version
        writer.Write((int)1);
        // encrypt
        writer.Write((int)encrypt);
        // nodes count
        writer.Write((int)nodes.Count);

        StringBuilder sb = new StringBuilder();

        foreach (VfsPackNode node in nodes)
        {
            writer.Write((int)node.relativePath.Length);
            writer.Write(SALang.StringToBuff(node.relativePath, encrypt));

            byte[] buff = ReadFileToBuff(node.absolutePath);
            SALang.XorBuff(ref buff, encrypt);

            writer.Write((int)buff.Length);
            writer.Write(buff);

            string filename = Path.GetFileName(node.relativePath);
            sb.Append(filename);
            sb.Append(",");
        }

        writer.Flush();
        outputHandle.Close();

		Debug.Log(string.Format("打包成功 {0} => {1}", inputDir, lastPath));

        return nodes.Count;
    }

}
