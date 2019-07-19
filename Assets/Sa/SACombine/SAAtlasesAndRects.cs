using UnityEngine;
using System.Collections.Generic;

[System.Serializable]
public class SAAtlasesAndRects {

    public Texture2D[] atlases;
    public Dictionary<Material, Rect> mat2rect_map;
    public string[] texPropertyNames;
}
