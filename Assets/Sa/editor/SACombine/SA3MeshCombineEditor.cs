using UnityEngine;
using UnityEditor;
using SA.Core;
using System.Collections.Generic;
using System.IO;
using System;

[CustomEditor(typeof(SA3TextureCombine))]
public class SA3TextureCombineEditor : Editor
{
    private static GUIContent
        exportGameObject = new GUIContent("导入列表选择的对象", "只有提供MeshFilter和MeshRenderer才可被导入"),
        //材质
        createPrefabAndMaterialLabelContent = new GUIContent("创建材质和网格的合并文件", "用于存储多个材质球的组合信息"),

        
        fixOutOfBoundsGUIContent = new GUIContent("限制UVs范围", "如果网格UVs超过[0,1]，UVs将缩放至[0,1]范围之内，纹理将平铺烘焙"),
        resizePowerOfTwoGUIContent = new GUIContent("二次幂纹理限制", "优化图集尺寸，仅当图集填充不为0的时候生效。"),
        //customShaderPropertyNamesGUIContent = new GUIContent("Custom Shader Propert Names", "Combine has a list of common texture properties that it looks for in shaders to generate atlases. Custom shaders may have texture properties not on this list. Add them here and Combine will generate atlases for them."),

        maxTilingBakeSizeGUIContent = new GUIContent("最大平铺纹理烘焙大小", "这是平铺纹理烘焙的最大尺寸"),
        objectsToCombineGUIContent = new GUIContent("对象集合", "此列表对象中的材质、贴图用来作为合并目标"),
        textureBakeResultsGUIContent = new GUIContent("材质和网格的合并文件", "存储材质、网格组合信息的文件"),
        texturePackingAgorithmGUIContent = new GUIContent("纹理封装器", "\'POT\'纹理封装器: 二次幂纹理图集. 较大的图集可能会崩溃. \n\n \'Mesh\'纹理封装器: 图集可以是最有效的尺寸 (不局限于二次幂限制). 更适合大型图集."),
        //configMultiMatFromObjsContent = new GUIContent("Build Source To Combined Mapping From \n Objects To Be Combined", "This will group the materials on your source objects by shader and create one source to combined mapping for each shader found. For example if combining trees then all the materials with the same bark shader will be grouped togther and all the materials with the same leaf material will be grouped together. You can adjust the results afterwards. \n\nIf fix out-of-bounds UVs is NOT checked then submeshes with UVs outside 0,0..1,1 will be mapped to their own submesh regardless of shader."),
        forcePowerOfTwoAtlasContent = new GUIContent("强制二次幂图集", "强制图集宽高比为: 1:1、1:2、2:1，Unity建议除了GUI纹理以外，其他每一个纹理都是二次幂尺寸");

    bool onlyStaticObjects = false;
    bool excludeMeshesWithOBuvs = true;
    bool onlyEnabledObjects = false;
    Material shaderMat = null;
    Material mat = null;
    int lightmapIndex = -2;

    private static GUIContent
        gc_ClusterType = new GUIContent("网格合并类型", "场景将被分割成单元，每个单元的网格将被分配到单独的网格烘焙器中"),
        gc_GridOrigin = new GUIContent("原点", "设置多个网格合并后的原点"),
        gc_CellSize = new GUIContent("单元大小", "设置单元大小"),
        gc_NumSegements = new GUIContent("片段数量", "饼视图中的片段(网孔)数量"),
        gc_PieAxis = new GUIContent("轴点", "场景根据这个轴点划分片段"),
        gc_ClusterOnLMIndex = new GUIContent("共享光照贴图", "共享光照贴图索引");

    //private long lastBoundsCheckRefreshTime = 0;

    private SerializedObject textureCombine;
    private SerializedObject grouper;

    ///材质   customShaderPropNames, 
    private SerializedProperty objsToMesh, textureBakeResults, resultMaterial, atlasPadding, resizePowerOfTwoTextures, maxTilingBakeSize, fixOutOfBoundsUVs, texturePackingAlgorithm, forcePowerOfTwoAtlas;
    ///网格
    private SerializedProperty clusterType, gridOrigin, cellSize, numSegments, pieAxis, clusterOnLMIndex;

    //SA3TextureCombineEditorInternal tbe = new SA3TextureCombineEditorInternal();

    public override void OnInspectorGUI()
    {
        texturesController();//材质操作

        meshController();

    }

    private void texturesController()
    {
        SA3TextureCombine combine = target as SA3TextureCombine;

        textureCombine = new SerializedObject(target);
        objsToMesh = textureCombine.FindProperty("objsToMesh");
        textureBakeResults = textureCombine.FindProperty("_textureBakeResults");
        resultMaterial = textureCombine.FindProperty("_resultMaterial");
        atlasPadding = textureCombine.FindProperty("_atlasPadding");
        resizePowerOfTwoTextures = textureCombine.FindProperty("_resizePowerOfTwoTextures");
        //customShaderPropNames = textureCombine.FindProperty("_customShaderPropNames");
        maxTilingBakeSize = textureCombine.FindProperty("_maxTilingBakeSize");
        fixOutOfBoundsUVs = textureCombine.FindProperty("_fixOutOfBoundsUVs");
        texturePackingAlgorithm = textureCombine.FindProperty("_packingAlgorithm");
        forcePowerOfTwoAtlas = textureCombine.FindProperty("_combineTexturePackerForcePowerOfTwo");

        //tbe.DrawGUI((SA3TextureCombine)target, typeof(SA3MeshCombineEditorWindow));

        EditorGUILayout.Separator();
        EditorGUILayout.LabelField("待合并的对象", EditorStyles.boldLabel);

        if (GUILayout.Button(exportGameObject))
        {
            List<GameObject> newMomObjs = GetFilteredList();
            SAEditorUtil.RegisterUndo(combine, "Add Objects");
            List<GameObject> momObjs = combine.GetObjectsToCombine();
            int numAdded = 0;
            for (int i = 0; i < newMomObjs.Count; i++)
            {
                if (!momObjs.Contains(newMomObjs[i]))
                {
                    momObjs.Add(newMomObjs[i]);
                    numAdded++;
                }
            }
        }
        EditorGUILayout.PropertyField(objsToMesh, objectsToCombineGUIContent, true);

        EditorGUILayout.Separator();
        EditorGUILayout.Separator();
        EditorGUILayout.LabelField("材质和网格的合并文件", EditorStyles.boldLabel);
        if (GUILayout.Button(createPrefabAndMaterialLabelContent))
        {
            string newPrefabPath = EditorUtility.SaveFilePanelInProject("Asset name", "", "asset", "Enter a name for the baked texture results");
            if (newPrefabPath != null)
            {
                CreateCombinedMaterialAssets(combine, newPrefabPath);
            }
        }

        EditorGUILayout.PropertyField(textureBakeResults, textureBakeResultsGUIContent);
        if (textureBakeResults.objectReferenceValue != null)
        {
            //显示需要合并的shader信息
            //showContainsReport = EditorGUILayout.Foldout(showContainsReport, "Shaders & Materials Contained");
            //if (showContainsReport)
            //{
            //    EditorGUILayout.HelpBox(((SA2TextureBakeResults)textureBakeResults.objectReferenceValue).GetDescription(), MessageType.Info);
            //}
        }

        EditorGUILayout.PropertyField(resultMaterial, new GUIContent("合并后的网格材质"));

        EditorGUILayout.Separator();
        //材质烘焙选项
        EditorGUILayout.LabelField("材质Bake选项", EditorStyles.boldLabel);
        EditorGUILayout.PropertyField(atlasPadding, new GUIContent("图集填充间距"));//图集 填充
        EditorGUILayout.PropertyField(resizePowerOfTwoTextures, resizePowerOfTwoGUIContent);
        //EditorGUILayout.PropertyField(customShaderPropNames, customShaderPropertyNamesGUIContent, true);//自定义材质球名称
        EditorGUILayout.PropertyField(maxTilingBakeSize, maxTilingBakeSizeGUIContent);//最大Tiling烘焙尺寸
        EditorGUILayout.PropertyField(fixOutOfBoundsUVs, fixOutOfBoundsGUIContent);//修复UVs范围

        EditorGUILayout.PropertyField(texturePackingAlgorithm, texturePackingAgorithmGUIContent);
        if (texturePackingAlgorithm.intValue == (int)SA2PackingAlgorithmEnum.Mesh)
        {
            EditorGUILayout.PropertyField(forcePowerOfTwoAtlas, forcePowerOfTwoAtlasContent);
        }
        EditorGUILayout.Separator();
        if (GUILayout.Button("合并多个材质"))
        {
            combine.CreateAtlases(updateProgressBar, true, new SA3EditorMethods());
            EditorUtility.ClearProgressBar();
            if (combine.textureBakeResults != null) EditorUtility.SetDirty(combine.textureBakeResults);
        }
        textureCombine.ApplyModifiedProperties();
        textureCombine.SetIsDifferentCacheDirty();
    }
    public void updateProgressBar(string msg, float progress)
    {
        EditorUtility.DisplayProgressBar("Combining Meshes", msg, progress);
    }
    public void CreateCombinedMaterialAssets(SA3TextureCombine combine, string pth)
    {
        string baseName = Path.GetFileNameWithoutExtension(pth);
        if (baseName == null || baseName.Length == 0) return;
        string folderPath = pth.Substring(0, pth.Length - baseName.Length - 6);

        List<string> matNames = new List<string>();
        if (combine.doMultiMaterial)
        {
            for (int i = 0; i < combine.resultMaterials.Length; i++)
            {
                matNames.Add(folderPath + baseName + "-mat" + i + ".mat");
                AssetDatabase.CreateAsset(new Material(Shader.Find("Diffuse")), matNames[i]);
                combine.resultMaterials[i].combinedMaterial = (Material)AssetDatabase.LoadAssetAtPath(matNames[i], typeof(Material));
            }
        }
        else
        {
            matNames.Add(folderPath + baseName + "-mat.mat");
            Material newMat = new Material(Shader.Find("Diffuse"));
            if (combine.GetObjectsToCombine().Count > 0 && combine.GetObjectsToCombine()[0] != null)
            {
                Renderer r = combine.GetObjectsToCombine()[0].GetComponent<Renderer>();
                if (r == null)
                {
                    Debug.LogWarning("Object " + combine.GetObjectsToCombine()[0] + " does not have a Renderer on it.");
                }
                else
                {
                    if (r.sharedMaterial != null)
                    {
                        newMat.shader = r.sharedMaterial.shader;
                        SA3TextureCombine.ConfigureNewMaterialToMatchOld(newMat, r.sharedMaterial);
                    }
                }
            }
            else
            {
                Debug.Log("If you add objects to be combined before creating the Combined Material Assets. Then Mesh Baker will create a result material that is a duplicate of the material on the first object to be combined. This saves time configuring the shader.");
            }
            AssetDatabase.CreateAsset(newMat, matNames[0]);
            combine.resultMaterial = (Material)AssetDatabase.LoadAssetAtPath(matNames[0], typeof(Material));
        }
        //create the SA2TextureBakeResults
        AssetDatabase.CreateAsset(ScriptableObject.CreateInstance<SA2TextureCombineResults>(), pth);
        combine.textureBakeResults = (SA2TextureCombineResults)AssetDatabase.LoadAssetAtPath(pth, typeof(SA2TextureCombineResults));
        AssetDatabase.Refresh();
    }

    List<GameObject> GetFilteredList()
    {
        List<GameObject> newMomObjs = new List<GameObject>();
        SA3MeshCombineRoot mom = (SA3MeshCombineRoot)target;
        if (mom == null)
        {
            Debug.LogError("Must select a target MeshBaker to add objects to");
            return newMomObjs;
        }
        GameObject dontAddMe = null;
        Renderer r = SAUtility.GetRenderer(mom.gameObject);
        if (r != null)
        { //make sure that this MeshBaker object is not in list
            dontAddMe = r.gameObject;
        }

        int numInSelection = 0;
        int numStaticExcluded = 0;
        int numEnabledExcluded = 0;
        int numLightmapExcluded = 0;
        int numOBuvExcluded = 0;

        GameObject[] gos = Selection.gameObjects;
        if (gos.Length == 0)
        {
            Debug.LogWarning("No objects selected in hierarchy view. Nothing added.");
        }

        for (int i = 0; i < gos.Length; i++)
        {
            GameObject go = gos[i];
            Renderer[] mrs = go.GetComponentsInChildren<Renderer>();
            for (int j = 0; j < mrs.Length; j++)
            {
                if (mrs[j] is MeshRenderer || mrs[j] is SkinnedMeshRenderer)
                {
                    if (mrs[j].GetComponent<TextMesh>() != null)
                    {
                        continue; //don't add TextMeshes
                    }
                    numInSelection++;
                    if (!newMomObjs.Contains(mrs[j].gameObject))
                    {
                        bool addMe = true;
                        if (!mrs[j].gameObject.isStatic && onlyStaticObjects)
                        {
                            numStaticExcluded++;
                            addMe = false;
                        }

                        if (!mrs[j].enabled && onlyEnabledObjects)
                        {
                            numEnabledExcluded++;
                            addMe = false;
                        }

                        if (lightmapIndex != -2)
                        {
                            if (mrs[j].lightmapIndex != lightmapIndex)
                            {
                                numLightmapExcluded++;
                                addMe = false;
                            }
                        }

                        Mesh mm = SAUtility.GetMesh(mrs[j].gameObject);
                        if (mm != null)
                        {
                            Rect dummy = new Rect();
                            if (SAUtility.hasOutOfBoundsUVs(mm, ref dummy) && excludeMeshesWithOBuvs)
                            {
                                if (shaderMat != null)
                                {
                                    numOBuvExcluded++;
                                    addMe = false;
                                }
                            }
                            else
                            {
                                Debug.LogWarning("Object " + mrs[j].gameObject.name + " uses uvs that are outside the range (0,1)" +
                                    "this object can only be combined with other objects that use the exact same set of source textures (one image in each atlas)" +
                                    " unless fix out of bounds UVs is used");
                            }
                        }

                        if (shaderMat != null)
                        {
                            Material[] nMats = mrs[j].sharedMaterials;
                            bool usesShader = false;
                            foreach (Material nMat in nMats)
                            {
                                if (nMat != null && nMat.shader == shaderMat.shader)
                                {
                                    usesShader = true;
                                }
                            }
                            if (!usesShader)
                            {
                                addMe = false;
                            }
                        }

                        if (mat != null)
                        {
                            Material[] nMats = mrs[j].sharedMaterials;
                            bool usesMat = false;
                            foreach (Material nMat in nMats)
                            {
                                if (nMat == mat)
                                {
                                    usesMat = true;
                                }
                            }
                            if (!usesMat)
                            {
                                addMe = false;
                            }
                        }

                        if (addMe && mrs[j].gameObject != dontAddMe)
                        {
                            if (!newMomObjs.Contains(mrs[j].gameObject))
                            {
                                newMomObjs.Add(mrs[j].gameObject);
                            }
                        }
                    }
                }
            }
        }
        Debug.Log("Total objects in selection " + numInSelection);
        if (numStaticExcluded > 0) Debug.Log(numStaticExcluded + " objects were excluded because they were not static");
        if (numEnabledExcluded > 0) Debug.Log(numEnabledExcluded + " objects were excluded because they were disabled");
        if (numOBuvExcluded > 0) Debug.Log(numOBuvExcluded + " objects were excluded because they had out of bounds uvs");
        if (numLightmapExcluded > 0) Debug.Log(numLightmapExcluded + " objects did not match lightmap filter.");
        return newMomObjs;
    }
    ///
    ///以下是网格操作
    ///
    private void meshController()
    {
        SA3TextureCombine combine = target as SA3TextureCombine;
        grouper = new SerializedObject(target);
        SerializedProperty grp = grouper.FindProperty("grouper");
        SerializedProperty clusterGrouper = grp.FindPropertyRelative("clusterGrouper");
        clusterType = clusterGrouper.FindPropertyRelative("clusterType");
        gridOrigin = clusterGrouper.FindPropertyRelative("origin");
        cellSize = clusterGrouper.FindPropertyRelative("cellSize");
        numSegments = clusterGrouper.FindPropertyRelative("pieNumSegments");
        pieAxis = clusterGrouper.FindPropertyRelative("pieAxis");
        clusterOnLMIndex = grp.FindPropertyRelative("clusterOnLMIndex");

        EditorGUILayout.LabelField("网格合并", EditorStyles.boldLabel);
        EditorGUILayout.PropertyField(clusterType, gc_ClusterType);
        //cg.clusterType = (SA3MeshCombineGrouperCore.ClusterType) EditorGUILayout.EnumPopup(gc_ClusterType,cg.clusterType);
        if (clusterType.enumValueIndex == (int)SA3MeshCombineGrouperCore.ClusterType.grid)
        {
            EditorGUILayout.PropertyField(gridOrigin, gc_GridOrigin);
            EditorGUILayout.PropertyField(cellSize, gc_CellSize);
        }
        else if (clusterType.enumValueIndex == (int)SA3MeshCombineGrouperCore.ClusterType.pie)
        {
            EditorGUILayout.PropertyField(gridOrigin, gc_GridOrigin);
            EditorGUILayout.PropertyField(numSegments, gc_NumSegements);
            EditorGUILayout.PropertyField(pieAxis, gc_PieAxis);
        }
        EditorGUILayout.PropertyField(clusterOnLMIndex, gc_ClusterOnLMIndex);

        if (GUILayout.Button("生成prefab数据模型"))
        {
            if (combine.GetObjectsToCombine().Count == 0)
            {
                Debug.LogError("没有需要合并的网格");
                return;
            }
            if (combine.transform.childCount > 0)
            {
                Debug.LogWarning("请删除当前SACombine子项后，再次点击\'生成prefab数据模型\'");
            }
            combine.grouper.DoClustering(combine);
        }

        if (GUILayout.Button("生成全部prefab网格对象"))
        {
            try
            {
                SA3MeshCombineCommon[] mBakers = combine.GetComponentsInChildren<SA3MeshCombineCommon>();
                for (int i = 0; i < mBakers.Length; i++)
                {
                    if (mBakers[i].textureBakeResults != null)
                    {
                        SA3MeshCombineEditorFunctions.BakeIntoCombined(mBakers[i]);
                    }
                }
            }
            catch (Exception e)
            {
                Debug.LogError(e);
            }
            finally
            {
                EditorUtility.ClearProgressBar();
            }
        }
        //隐藏子对象
        //string buttonTextEnableRenderers = "Disable Renderers On All Child Combines";
        //bool enableRenderers = false;
        //if (combine != null && combine.GetObjectsToCombine().Count > 0)
        //{
        //    GameObject go = combine.GetObjectsToCombine()[0];
        //    if (go != null && go.GetComponent<Renderer>() != null && go.GetComponent<Renderer>().enabled == false)
        //    {
        //        buttonTextEnableRenderers = "Enable Renderers On All Child Combine";
        //        enableRenderers = true;
        //    }
        //}
        //if (GUILayout.Button(buttonTextEnableRenderers))
        //{
        //    try
        //    {
        //        SA3MeshCombineCommon[] mBakers = combine.GetComponentsInChildren<SA3MeshCombineCommon>();
        //        for (int i = 0; i < mBakers.Length; i++)
        //        {
        //            for (int j = 0; j < mBakers[i].GetObjectsToCombine().Count; j++)
        //            {
        //                GameObject go = mBakers[i].GetObjectsToCombine()[j];
        //                if (go != null && go.GetComponent<Renderer>() != null)
        //                {
        //                    go.GetComponent<Renderer>().enabled = enableRenderers;
        //                }
        //            }
        //        }
        //    }
        //    catch (Exception e)
        //    {
        //        Debug.LogError(e);
        //    }
        //    finally
        //    {
        //        EditorUtility.ClearProgressBar();
        //    }
        //}

        //防止暴力点击
        //if (DateTime.UtcNow.Ticks - lastBoundsCheckRefreshTime > 10000000 && combine != null)
        //{
        //    List<GameObject> gos = combine.GetObjectsToCombine();
        //    Bounds b = new Bounds(Vector3.zero, Vector3.one);
        //    if (gos.Count > 0 && gos[0] != null && gos[0].GetComponent<Renderer>() != null)
        //    {
        //        b = gos[0].GetComponent<Renderer>().bounds;
        //    }
        //    for (int i = 0; i < gos.Count; i++)
        //    {
        //        if (gos[i] != null && gos[i].GetComponent<Renderer>() != null)
        //        {
        //            b.Encapsulate(gos[i].GetComponent<Renderer>().bounds);
        //        }
        //    }
        //    combine.sourceObjectBounds = b;
        //    lastBoundsCheckRefreshTime = DateTime.UtcNow.Ticks;
        //}

        grouper.ApplyModifiedProperties();
    }
}
