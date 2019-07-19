using UnityEngine;
using System.Collections.Generic;
using Sacu.Factory.Worker;
using Sacu.Utils;
using Datas;
using Sacu.Collection;
using Sacu.Events;
using org.jiira.protobuf;

namespace Graphs
{
    public class ConsoleUIGraphWorker : SAGraphWorker
    {
        // Use this for initialization
        private GameObject consoleBtn;
        private GameObject clearBtn;
        private GameObject colliderBtn;
        private GameObject GMBtn;
        private GameObject getCardBtn;
        private GameObject getGoldBtn;
        private GameObject getExpBtn;
        private GameObject getZuanshiBtn;
        private GameObject backBtn;

        private GameObject console;
        private GameObject GMPanel;
        private bool isActive;
        private bool isClick;
        private UILabel showIsCollider;
        void Awake()
        {
            consoleBtn = this.transform.Find("ConsoleBtn").gameObject;
            clearBtn = this.transform.Find("ClearBtn").gameObject;
            colliderBtn = this.transform.Find("Collider").gameObject;
            GMBtn = this.transform.Find("GMBtn").gameObject;
            getCardBtn = this.transform.Find("GMPanel/GetCardBtn").gameObject;
            getGoldBtn = this.transform.Find("GMPanel/GetGold").gameObject;
            getExpBtn = this.transform.Find("GMPanel/GetExp").gameObject;
            getZuanshiBtn = this.transform.Find("GMPanel/GetZuanshi").gameObject;
            backBtn = this.transform.Find("GMPanel/Back").gameObject;

            UIEventListener.Get(consoleBtn).onClick = consoleLogClick;
            UIEventListener.Get(clearBtn).onClick = clearBtnClick;
            UIEventListener.Get(colliderBtn).onClick = colliderClick;
            UIEventListener.Get(GMBtn).onClick = gmClick;
            UIEventListener.Get(backBtn).onClick = backlick;
            console = this.transform.Find("Console").gameObject;
            GMPanel = this.transform.Find("GMPanel").gameObject;
            showIsCollider = this.transform.Find("Collider/Label").GetComponent<UILabel>();
        }
        override protected void onRegister()
        {
            base.onRegister();
        }
        private void consoleLogClick(GameObject btn)
        {
            if (isActive)
            {
                console.SetActive(true);
                isActive = false;
            }
            else
            {
                console.SetActive(false);
                isActive = true;
            }

        }
        private void clearBtnClick(GameObject btn)
        {
            console.transform.GetComponent<UITextList>().Clear();
        }
        private void colliderClick(GameObject btn)
        {
            if (isClick)
            {
                console.transform.GetComponent<BoxCollider>().enabled = false;
                showIsCollider.text = "开";
                isClick = false;
            }
            else
            {
                console.transform.GetComponent<BoxCollider>().enabled = true;
                showIsCollider.text = "关";
                isClick = true;
            }
        }
        //打开GMPanel的方法
        private void gmClick(GameObject btn)
        {
            GMPanel.SetActive(true);
            
        }
        
        //返回GMPanel的方法
        private void backlick(GameObject btn)
        {
            GMPanel.SetActive(false);
        }
    }
}
