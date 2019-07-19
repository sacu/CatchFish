using UnityEngine;
using System.Collections;

namespace Utils.Thread.LoadFile
{
    public class ThreadFileData
    {
        public string local;
        public string remote;
        public ThreadFileData(string local, string remote)
        {
            this.local = local;
            this.remote = remote;
        }
    }
}

