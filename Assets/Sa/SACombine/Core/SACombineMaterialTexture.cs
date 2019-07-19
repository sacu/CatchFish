using UnityEngine;
using System.Collections;

public class SACombineMaterialTexture {
    public Vector2 offset = new Vector2(0f, 0f);
        public Vector2 scale = new Vector2(1f, 1f);
        public Vector2 obUVoffset = new Vector2(0f, 0f);
        public Vector2 obUVscale = new Vector2(1f, 1f);
        public Texture2D t;
        public SACombineMaterialTexture() { }
        public SACombineMaterialTexture(Texture2D tx) { t = tx; }
        public SACombineMaterialTexture(Texture2D tx, Vector2 o, Vector2 s, Vector2 oUV, Vector2 sUV)
        {
            t = tx;
            offset = o;
            scale = s;
            obUVoffset = oUV;
            obUVscale = sUV;
        }
}
