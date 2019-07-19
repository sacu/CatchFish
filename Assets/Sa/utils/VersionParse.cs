using System;

namespace Sacu.Utils
{
    // 版本号位
    public static class VersionBit
    {
        public const int MASTER = 0;
        public const int BINARY = 1;
        public const int MAJOR = 2;
        public const int MIN = 3;
    }

    public class VersionData
    {
        // master. binary. major. min
        public int[] versionData = new int[4] { 0, 0, 0, 0 };

        public readonly static VersionData zero = new VersionData();

        public int this[int index]
        {
            get
            {
                return versionData[index];
            }

            set
            {
                versionData[index] = value;
            }
        }

        public bool BinaryGreat(VersionData src)
        {
            if (this[VersionBit.MASTER] == src[VersionBit.MASTER])
            {
                return this[VersionBit.BINARY] > src[VersionBit.BINARY];
            }
            return this[VersionBit.MASTER] > src[VersionBit.MASTER];
        }

        public bool BinaryEqual(VersionData src)
        {
            return this[VersionBit.MASTER] == src[VersionBit.MASTER]
                && this[VersionBit.BINARY] == src[VersionBit.BINARY];
        }

        public bool Load(string str)
        {
            string[] v = str.Split('.');
            if (v.Length != 4)
            {
                return false;
            }

            for (int i = 0; i < 4; ++i)
            {
                int dt;
                if (int.TryParse(v[i], out dt))
                {
                    versionData[i] = dt;
                }
                else
                {
                    return false;
                }
            }

            return true;
        }

        public void SetValue(VersionData src)
        {
            for (int i = 0; i < 4; ++i)
            {
                versionData[i] = src.versionData[i];
            }
        }

        public override string ToString()
        {
            return string.Format("{0}.{1}.{2}.{3}", versionData[0], versionData[1], versionData[2], versionData[3]);
        }

        public bool Equal(VersionData version)
        {
            for (int i = 0; i < 4; ++i)
            {
                if (versionData[i] != version.versionData[i])
                {
                    return false;
                }
            }

            return true;
        }

        public bool Great(VersionData version)
        {
            for (int i = 0; i < 4; ++i)
            {
                if (versionData[i] == version.versionData[i])
                {
                    continue;
                }

                return versionData[i] > version.versionData[i];
            }

            return false;
        }

        // 规范化到 Major版本 (也就是把Min版本号置为0)
        public void NormalizeToMajorVersion()
        {
            versionData[VersionBit.MIN] = 0;
        }

        public void NormalizeToBinaryVersion()
        {
            versionData[VersionBit.MAJOR] = 0;
            versionData[VersionBit.MIN] = 0;
        }

        public bool IsMajorVersion()
        {
            return versionData[VersionBit.MIN] == 0;
        }

        public int CompareTo(VersionData d)
        {
            if (Equal(d))
            {
                return 0;
            }

            if (Great(d))
            {
                return 1;
            }

            return -1;
        }

        public VersionData Clone()
        {
            VersionData d = new VersionData();
            d.SetValue(this);
            return d;
        }
    }
}

