using UnityEngine;
using System.Collections;


namespace Sacu.Utils
{
    public class ActionCollection
    {
        public const string OnRayHit = "on.ray.hit";//射线碰撞通知
        public const string ShareSDKRequest = "share.request";//share 请求
        public const string ShareSDKResponse = "share.response";//shaer 返回
        public const string LocalFile = ".local.file";
        public const string AnimationComplete = "AnimationComplete.";   //动画完成
        public const string missionRefreshTime = "RefreshTime";//刷新时间
        public const string receiveExp = "receiveExp";//接受等级经验值
        public const string LastExp = "LastExp";
        public const string CurrentExp = "CurrentExp";
        public const string LastLevel = "LastLevel";
        public const string CurrentLevel = "CurrentLevel";
        public const string GooglePayPrice = "GooglePayPrice";
        public const string GooglePayIsSuccess = "GooglePayIsSuccess";

        public const int Percentage = 100;
        public readonly static Vector2 PosTiling = new Vector2(-1f, -1f);
        public readonly static Vector2[] PosOffset = new Vector2[] {
            new Vector2(0f, 0f),//无牌
            new Vector2(0f, 0f),//红框
            new Vector2(0f, 0f),//黄框
            new Vector2(0f, 0f),//有牌
        };

        public readonly static Vector2 Tiling = new Vector2(-0.09f, -0.5f);
        public readonly static Vector2[] Offset = new Vector2[] {
            new Vector2(0.09f, 0.5f),//蓝色0
            new Vector2(0.18f, 0.5f),//蓝色1
            new Vector2(0.27f, 0.5f),//蓝色2
            new Vector2(0.36f, 0.5f),//蓝色3
            new Vector2(0.45f, 0.5f),//蓝色4
            new Vector2(0.54f, 0.5f),//蓝色5
            new Vector2(0.64f, 0.5f),//蓝色6
            new Vector2(0.73f, 0.5f),//蓝色7
            new Vector2(0.82f, 0.5f),//蓝色8
            new Vector2(0.91f, 0.5f),//蓝色9
            new Vector2(0f, 0.5f),//蓝色S
            new Vector2(0.09f, 0.5f),//红色0
            new Vector2(0.18f, 0f),//红色1
            new Vector2(0.27f, 0f),//红色2
            new Vector2(0.36f, 0f),//红色3
            new Vector2(0.45f, 0f),//红色4
            new Vector2(0.54f, 0f),//红色5
            new Vector2(0.64f, 0f),//红色6
            new Vector2(0.73f, 0f),//红色7
            new Vector2(0.82f, 0f),//红色8
            new Vector2(0.91f, 0f),//红色9
            new Vector2(0f, 0f),//红色S
        };
    }
}

