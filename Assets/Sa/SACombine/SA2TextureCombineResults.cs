﻿using UnityEngine;
using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

public class SA2TextureCombineResults : ScriptableObject
{
    public SAAtlasesAndRects[] combinedMaterialInfo;
    public Material[] materials;
    public Rect[] prefabUVRects;
    public Material resultMaterial;
    public SAMultiMaterial[] resultMaterials;
    public bool doMultiMaterial;
    public bool fixOutOfBoundsUVs;

    public Dictionary<Material, Rect> GetMat2RectMap()
    {
        Dictionary<Material, Rect> mat2rect_map = new Dictionary<Material, Rect>();
        if (materials == null || prefabUVRects == null || materials.Length != prefabUVRects.Length)
        {
            Debug.LogWarning("Bad TextureBakeResults could not build mat2UVRect map");
        }
        else
        {
            for (int i = 0; i < materials.Length; i++)
            {
                mat2rect_map.Add(materials[i], prefabUVRects[i]);
            }
        }
        return mat2rect_map;
    }

    public string GetDescription()
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("Shaders:\n");
        HashSet<Shader> shaders = new HashSet<Shader>();
        if (materials != null)
        {
            for (int i = 0; i < materials.Length; i++)
            {
                shaders.Add(materials[i].shader);
            }
        }

        foreach (Shader m in shaders)
        {
            sb.Append("  ").Append(m.name).AppendLine();
        }
        sb.Append("Materials:\n");
        if (materials != null)
        {
            for (int i = 0; i < materials.Length; i++)
            {
                sb.Append("  ").Append(materials[i].name).AppendLine();
            }
        }
        return sb.ToString();
    }
}