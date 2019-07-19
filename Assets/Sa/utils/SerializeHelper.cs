using UnityEngine;
using System.Collections;
using System.Text.RegularExpressions;

namespace Sacu.Utils
{

    public static class SerializeHelper
    {
        static public bool ReadVector3(string str, ref Vector3 p)
        {
            if (str.Length == 0)
            {
                return false;
            }

            string[] s = str.Split(',');
            if (s.Length != 3)
            {
                return false;
            }

            p.x = float.Parse(s[0]);
            p.y = float.Parse(s[1]);
            p.z = float.Parse(s[2]);

            return true;
        }

        static public bool ReadColor(string str, ref Color p)
        {
            if (str.Length == 0)
            {
                return false;
            }

            string[] s = str.Split(',');
            if (s.Length != 4)
            {
                return false;
            }

            p.r = float.Parse(s[0]);
            p.g = float.Parse(s[1]);
            p.b = float.Parse(s[2]);
            p.a = float.Parse(s[3]);

            return true;
        }

        static public void ReadTransform(System.Security.SecurityElement node, Transform trans)
        {
            if (node != null && node.Children != null)
            {
                foreach (System.Security.SecurityElement child in node.Children)
                {
                    if (child.Tag == "Trans")
                    {
                        SerializeHelper.ReadTransformEx(child, trans);
                        return;
                    }
                }
            }
        }

        static public void ReadTransformEx(System.Security.SecurityElement node, Transform trans)
        {
            Vector3 p = Vector3.zero;
            ReadVector3(node.Attribute("P"), ref p);
            
            Vector3 r = Vector3.zero;
            ReadVector3(node.Attribute("R"), ref r);

            Vector3 s = Vector3.one;
            ReadVector3(node.Attribute("S"), ref s);
            
            trans.localPosition = p;
            trans.localScale = s;
            trans.localRotation = Quaternion.Euler(r);
        }

    }



}