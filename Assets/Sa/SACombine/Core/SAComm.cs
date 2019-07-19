using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System;
using System.Text;

namespace SA.Core
{

    public delegate void ProgressUpdateDelegate(string msg, float progress);

    public enum SAObjsToCombineTypes
    {
        prefabOnly,
        sceneObjOnly,
        dontCare
    }

    public enum SAOutputOptions
    {
        bakeIntoPrefab,
        bakeMeshsInPlace,
        bakeTextureAtlasesOnly,
        bakeIntoSceneObject
    }

    public enum SARenderType
    {
        meshRenderer,
        skinnedMeshRenderer
    }

    public enum SA2OutputOptions
    {
        bakeIntoSceneObject,
        bakeMeshAssetsInPlace,
        bakeIntoPrefab
    }

    public enum SA2LightmapOptions
    {
        preserve_current_lightmapping,
        ignore_UV2,
        copy_UV2_unchanged,
        generate_new_UV2_layout
    }

    public enum SA2PackingAlgorithmEnum
    {
        POT,//UnitysPackTextures,
        Mesh//MeshCombineTexturePacker
    }

    public enum SA2ValidationLevel
    {
        none,
        quick,
        robust
    }

    public interface SA2EditorMethodsInterface
    {
        void Clear();
        void SetReadFlags(ProgressUpdateDelegate progressInfo);
        void SetReadWriteFlag(Texture2D tx, bool isReadable, bool addToList);
        void AddTextureFormat(Texture2D tx, bool isNormalMap);
        void SaveAtlasToAssetDatabase(Texture2D atlas, string texPropertyName, int atlasNum, Material resMat);
        void SetMaterialTextureProperty(Material target, string texPropName, string texturePath);
        void SetNormalMap(Texture2D tx);
        bool IsNormalMap(Texture2D tx);
        string GetPlatformString();
        void SetTextureSize(Texture2D tx, int size);
        bool IsCompressed(Texture2D tx);
        int GetMaximumAtlasDimension();
        void CheckBuildSettings(long estimatedAtlasSize);
        bool CheckPrefabTypes(SAObjsToCombineTypes prefabType, List<GameObject> gos);
        bool ValidateSkinnedMeshes(List<GameObject> mom);
        void Destroy(UnityEngine.Object o);
    }

    ///
    /// Log
    /// 

    public enum SA2LogLevel
    {
        none,
        error,
        warn,
        info,
        debug,
        trace
    }

    public class SA2Log
    {

        public static void Log(SA2LogLevel l, String msg, SA2LogLevel currentThreshold)
        {
            if (l <= currentThreshold)
            {
                if (l == SA2LogLevel.error) Debug.LogError(msg);
                if (l == SA2LogLevel.warn) Debug.LogWarning(String.Format("frm={0} WARN {1}", Time.frameCount, msg));
                if (l == SA2LogLevel.info) Debug.Log(String.Format("frm={0} INFO {1}", Time.frameCount, msg));
                if (l == SA2LogLevel.debug) Debug.Log(String.Format("frm={0} DEBUG {1}", Time.frameCount, msg));
                if (l == SA2LogLevel.trace) Debug.Log(String.Format("frm={0} TRACE {1}", Time.frameCount, msg));
            }
        }

        public static string Error(string msg, params object[] args)
        {
            string s = String.Format(msg, args);
            string s2 = String.Format("f={0} ERROR {1}", Time.frameCount, s);
            Debug.LogError(s2);
            return s2;
        }

        public static string Warn(string msg, params object[] args)
        {
            string s = String.Format(msg, args);
            string s2 = String.Format("f={0} WARN {1}", Time.frameCount, s);
            Debug.LogWarning(s2);
            return s2;
        }

        public static string Info(string msg, params object[] args)
        {
            string s = String.Format(msg, args);
            string s2 = String.Format("f={0} INFO {1}", Time.frameCount, s);
            Debug.Log(s2);
            return s2;
        }

        public static string LogDebug(string msg, params object[] args)
        {
            string s = String.Format(msg, args);
            string s2 = String.Format("f={0} DEBUG {1}", Time.frameCount, s);
            Debug.Log(s2);
            return s2;
        }

        public static string Trace(string msg, params object[] args)
        {
            string s = String.Format(msg, args);
            string s2 = String.Format("f={0} TRACE {1}", Time.frameCount, s);
            Debug.Log(s2);
            return s2;
        }
    }
    public class ObjectLog
    {
        int pos = 0;
        string[] logMessages;

        void _CacheLogMessage(string msg)
        {
            if (logMessages.Length == 0) return;
            logMessages[pos] = msg;
            pos++;
            if (pos >= logMessages.Length) pos = 0;
        }

        public ObjectLog(short bufferSize)
        {
            logMessages = new string[bufferSize];
        }

        public void Log(SA2LogLevel l, String msg, SA2LogLevel currentThreshold)
        {
            SA2Log.Log(l, msg, currentThreshold);
            _CacheLogMessage(msg);
        }

        public void Error(string msg, params object[] args)
        {
            _CacheLogMessage(SA2Log.Error(msg, args));
        }

        public void Warn(string msg, params object[] args)
        {
            _CacheLogMessage(SA2Log.Warn(msg, args));
        }

        public void Info(string msg, params object[] args)
        {
            _CacheLogMessage(SA2Log.Info(msg, args));
        }

        public void LogDebug(string msg, params object[] args)
        {
            _CacheLogMessage(SA2Log.LogDebug(msg, args));
        }

        public void Trace(string msg, params object[] args)
        {
            _CacheLogMessage(SA2Log.Trace(msg, args));
        }

        public string Dump()
        {
            StringBuilder sb = new StringBuilder();
            int startPos = 0;
            if (logMessages[logMessages.Length - 1] != null) startPos = pos;
            for (int i = 0; i < logMessages.Length; i++)
            {
                int ii = (startPos + i) % logMessages.Length;
                if (logMessages[ii] == null) break;
                sb.AppendLine(logMessages[ii]);
            }
            return sb.ToString();
        }
    }	
}
