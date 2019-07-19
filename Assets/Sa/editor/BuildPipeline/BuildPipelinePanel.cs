using System;
using UnityEditor;
using UnityEngine;
using System.Collections.Generic;
using System.IO;
using System.Xml;
using System.Text;

using Sacu.Utils;
public partial class BuildPipelinePanel: EditorWindow
{
    //平台配置
    int currentPlatform = 0;
    
    const int platformAndroid = 0;
    const int platformIos = 1;
    const int platformWin32 = 2;

    string[] platformName = new string[] 
    {
        "android",
        "ios",
        "win32",
    };
    
    void OnGUI()
    {
        GUILayout.BeginVertical();
        
        GUILayout.Label("项目路径", EditorStyles.largeLabel);
        GUILayout.Label(SAAppConfig.DevDir, EditorStyles.boldLabel);
        GUILayout.Space(10f);
        GUILayout.EndVertical();
        
        //调试构建选项
        GUILayout.BeginVertical();
        GUILayout.Space(5f);
        GUILayout.EndVertical();
        
        GUILayout.BeginVertical();
        
        //选择平台
        GUIStyle popupStyle = new GUIStyle(EditorStyles.popup);
        popupStyle.fixedHeight = 16;
        popupStyle.fontSize = 12;
        popupStyle.fontStyle = FontStyle.Bold;
        
        GUILayoutOption[] popupLayout = new GUILayoutOption[]{GUILayout.Width(80)};
        
        GUILayout.BeginHorizontal();
        
        GUILayout.Label("平台设置", EditorStyles.largeLabel);
        GUILayout.Space(10f);
        
        GUILayout.BeginVertical();
        GUILayout.Space(5f);
        currentPlatform = EditorGUILayout.Popup(
            currentPlatform, platformName, popupStyle, popupLayout);
        GUILayout.EndVertical();
        
        GUILayout.EndHorizontal();
        
        GUILayout.EndVertical();
        
        GUILayout.Space(5f);
        DrawDebugTool();
        
    }
    private BuildTarget currentBuildTarget
    {
        get
        {
            if (currentPlatform == platformAndroid)
            {
                return BuildTarget.Android;
            } else if (currentPlatform == platformIos)
            {
                return BuildTarget.iOS;
            } 
            
            return BuildTarget.StandaloneWindows;
        }
    }
    
}

