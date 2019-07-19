
using System;
using UnityEngine;
using UnityEditor;
using System.Collections;

namespace SA.Core {
    public class SAVersionEditorConcrete : SAVersionEditorInterface
    {

        public string GetPlatformString()
        {

#if (UNITY_4_6 || UNITY_4_5 || UNITY_4_3 || UNITY_4_2 || UNITY_4_1 || UNITY_4_0_1 || UNITY_4_0 || UNITY_3_5)
			if (EditorUserBuildSettings.activeBuildTarget == BuildTarget.iPhone){
				return "iPhone";	
			}
#else
            if (EditorUserBuildSettings.activeBuildTarget == BuildTarget.iOS)//(UNITY_5_0 || UNITY_5_1)
            {
                return "iPhone";
            }
#endif
            if (EditorUserBuildSettings.activeBuildTarget == BuildTarget.Android)
            {
                return "Android";
            }
            if (EditorUserBuildSettings.activeBuildTarget == BuildTarget.StandaloneLinux ||
                EditorUserBuildSettings.activeBuildTarget == BuildTarget.StandaloneWindows ||
                EditorUserBuildSettings.activeBuildTarget == BuildTarget.StandaloneWindows64 ||
                EditorUserBuildSettings.activeBuildTarget == BuildTarget.StandaloneOSXIntel
                )
            {
                return "Standalone";
            }
            return null;
        }

        public int GetMaximumAtlasDimension()
        {
            int atlasMaxDimension = 4096;
            if (!Application.isPlaying)
            {
                if (EditorUserBuildSettings.activeBuildTarget == BuildTarget.Android) atlasMaxDimension = 2048;
#if (UNITY_4_6 || UNITY_4_5 || UNITY_4_3 || UNITY_4_2 || UNITY_4_1 || UNITY_4_0_1 || UNITY_4_0 || UNITY_3_5)
                if (EditorUserBuildSettings.activeBuildTarget == BuildTarget.iPhone) atlasMaxDimension = 4096;
#else
                if (EditorUserBuildSettings.activeBuildTarget == BuildTarget.iOS) atlasMaxDimension = 4096;//(UNITY_5_0 || UNITY_5_1)
#endif
            }
            else
            {
                if (Application.platform == RuntimePlatform.Android) atlasMaxDimension = 2048;
                if (Application.platform == RuntimePlatform.IPhonePlayer) atlasMaxDimension = 4096;
            }
            return atlasMaxDimension;
        }
    }
}

