using UnityEngine;
using System.Collections;

namespace Utils
{
    public class ProgressData
    {
        public string name;//名称
        public long total;//总
        public long current;//当前
        public double progress;//进度比例 最大100
        public string info;
        public byte[] data;
        public ProgressData(long total = 0, long current = 0, float progress = 0)
        {
            revert(total, current, progress);
        }
        public void revert(long total = 0, long current = 0, float progress = 0)
        {
            this.total = total;
            this.current = current;
            this.progress = progress;
        }
    }

}
