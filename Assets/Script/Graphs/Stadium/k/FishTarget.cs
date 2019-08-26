using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Sacu.Utils;
using Graphs;

namespace fish{
	public class FishTarget : MonoBehaviour{
        private long delay;
        private bool exit;

        private long startTime;
        private long currentTime;
        private List<FishData> sof;
        private StadiumGraphWorker graph;
        /**
         * long begin               开始时间
         * long current             当前时间
         * List<FishData> sof       鱼群
         * List<int> fsid           生存鱼的ID
         */
        public void init(StadiumGraphWorker graph,long startTime, long currentTime, List<FishData> sof)
        {
            this.graph = graph;
            this.startTime = startTime;
            this.currentTime = currentTime;
            this.sof = sof;
            exit = false;
            StartCoroutine("refresh");
        }

        /*IEnumerator DoSomething ()
        {
            FishData f;
            for (int i; i < sof.Length; ++i)
            {
                f = sof[i];

            }
			for (int i = 0; i < 300; ++i) {
				fish.FishFactory.RandomFish (this);
				yield return new WaitForSeconds(1);
			}
		}*/
        IEnumerator refresh()
        {
            int i = 0;//数组递增
            FishData fd;
            int gap = 0;
            delay = currentTime - startTime;//获取当前已逝去时间
            while (true)
            {
                fd = sof[i];
                if (fd.delay > delay)
                {
                    gap = (int)(fd.delay - delay);
                    delay += gap;
                    yield return new WaitForSeconds(gap / 1000);
                }
                else
                {
                    GameObject test = GameObject.Instantiate((GameObject)SACache.getObjectWithName("model/fish/" + fd.fishID));
                    FishSwim fs = test.AddComponent<FishSwim>();
                    fs.setInfo(graph, fd, delay);
                    ++i;
                }
                if (i >= sof.Count || exit)
                {
                    break;//结束
                }
            }
            StopCoroutine("refresh");
        }
        public void close()
        {
            exit = true;
            StopCoroutine("refresh");
            Destroy(this);
        }
    }
}

