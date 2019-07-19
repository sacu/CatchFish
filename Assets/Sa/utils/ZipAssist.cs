using System;
using System.IO;
using ICSharpCode.SharpZipLib.Zip;
using UnityEngine;

namespace Sacu.Utils
{
    public class ZipAssist
    {
        static public bool Compress(string outputFilename, string[] inputFilepaths, string[] inputNames, int lv = 9)
        {
            try
            {
                SALang.ForceDeleteFile(outputFilename);

                ZipOutputStream zipHandle = new ZipOutputStream(File.Create(outputFilename));
                zipHandle.SetLevel(lv);  // 0-9, 存储－＞最好
                byte[] buffer = new byte[1024 * 8];
                for (int i = 0; i < inputFilepaths.Length; ++i)
                {
                    string filePath = inputFilepaths[i];

                    string name;
                    if (inputNames != null && i < inputNames.Length)
                    {
                        name = inputNames[i];
                    }
                    else
                    {
                        name = Path.GetFileName(filePath);
                    }

                    ZipEntry entry = new ZipEntry(name);
                    entry.DateTime = DateTime.Now;
                    zipHandle.PutNextEntry(entry);
                    FileStream fs = File.OpenRead(filePath);
                    int sourceBytes = 0;
                    do
                    {
                        sourceBytes = fs.Read(buffer, 0, buffer.Length);
                        zipHandle.Write(buffer, 0, sourceBytes);
                    } while (sourceBytes > 0);
                }

                zipHandle.Finish();
                zipHandle.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception during processing {0}", ex);
                return false;
            }
            return true;
        }

        static public bool Uncompress(string inputFilename, string releaseRootDir)
        {
            if (!File.Exists(inputFilename))
            {
                Debug.LogError("UncompressErr1:" + inputFilename);
                return false;
            }

            SALang.MakDirValid(releaseRootDir);

            FileStream fileHandle = File.OpenRead(inputFilename);
            if (fileHandle == null)
            {
                Debug.LogError("UncompressErr2:" + inputFilename);
                return false;
            }

            try
            {
                ZipInputStream zipHandle = new ZipInputStream(fileHandle);
                byte[] buff = new byte[1024 * 8];
                ZipEntry theEntry;
                while ((theEntry = zipHandle.GetNextEntry()) != null)
                {
                    string directoryName = Path.GetDirectoryName(theEntry.Name);
                    string fileName = Path.GetFileName(theEntry.Name);
                    if (string.IsNullOrEmpty(fileName))
                    {
                        continue;
                    }

                    string releaseDir = Path.Combine(releaseRootDir, directoryName);
                    SALang.MakDirValid(releaseDir);

                    string filePath = Path.Combine(releaseDir, fileName);
                    if (File.Exists(filePath))
                    {
                        SALang.ForceDeleteFile(filePath);
                    }

                    FileStream streamWriter = File.Create(filePath);
                    while (true)
                    {
                        int size = zipHandle.Read(buff, 0, buff.Length);
                        if (size > 0)
                        {
                            streamWriter.Write(buff, 0, size);
                        }
                        else
                        {
                            break;
                        }
                    }
                    streamWriter.Close();

                    Debug.Log(string.Format("释放文件{0}成功.", filePath));
                }
            }
            catch (Exception e)
            {
                Debug.LogError("UncompressErr3:" + inputFilename);
                Debug.LogError(e.ToString());
                fileHandle.Close();
                return false;
            }

            fileHandle.Close();
            return true;
        }
    }

}