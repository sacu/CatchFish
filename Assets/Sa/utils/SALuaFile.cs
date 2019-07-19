using UnityEngine;
using System.Collections;

namespace Sacu.Utils
{
    public struct SALuaFile
    {
        public SALuaFile(long _offset, long _size)
        {
            offset = _offset;
            size = _size;
        }

        public long offset;
        public long size;
    }
}