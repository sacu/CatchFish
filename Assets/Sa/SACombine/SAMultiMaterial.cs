using UnityEngine;
using System.Collections.Generic;

[System.Serializable]
public class SAMultiMaterial {
    public Material combinedMaterial;
    public List<Material> sourceMaterials = new List<Material>();
}
