using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FishData {
    public int id;//序号（用来记录鱼的序号作为场景击杀判定）
    public int fishID;//鱼ID
    public int delay;//延迟出现时间
    public int begin;//起始点
    public int end;//结束点
    public FishData(int id, string data)
    {
        this.id = id;
        string[] sofStr = data.Split(':');//找到存活的鱼数据
        fishID = int.Parse(sofStr[0]);
        delay = int.Parse(sofStr[1]) * 2;
        begin = int.Parse(sofStr[2]);
        end = int.Parse(sofStr[3]);
    }
}
