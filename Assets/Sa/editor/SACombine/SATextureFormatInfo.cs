using UnityEngine;
using UnityEditor;

using System.Collections;

public class SATextureFormatInfo {

	public TextureImporterFormat format;
    public bool isNormalMap;
    public System.String platform;
    public TextureImporterFormat platformOverrideFormat;

    public SATextureFormatInfo(TextureImporterFormat f, string p, TextureImporterFormat pf, bool isNormMap)
    {
        format = f;
        platform = p;
        platformOverrideFormat = pf;
        isNormalMap = isNormMap;
    }
}
