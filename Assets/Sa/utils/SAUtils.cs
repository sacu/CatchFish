using Sacu.Factory.Worker;
using Sacu.Utils;

namespace Sacu.Utils
{
    using UnityEngine;
    using Sacu.Collection;
    public class SAUtils
    {
        private static UILabel console;
        private static UITextList textList;
        public static void showText()
        {

        }
        public static void showError(int errorId)
        {

        }

        public static void Log(string str)
        {
            if (!SAAppConfig.IsLog)
                return;
            Debug.Log(str);
        }
        public static void Log(string str, params object[] args)
        {
            if (!SAAppConfig.IsLog)
                return;
            str = string.Format(str, args);
            Log(str);
            ConsoleMessage("[log] " + str);
        }
        
        public static void LogWarning(string str)
        {
            if (!SAAppConfig.IsLog)
                return;
            Debug.LogWarning(str);
        }

        public static void LogWarning(string str, params object[] args)
        {
            if (!SAAppConfig.IsLog)
                return;
            str = string.Format(str, args);
            LogWarning(str);
        }

        public static void LogError(string str)
        {
            if (!SAAppConfig.IsLog)
                return;
            Debug.LogError(str);
            ConsoleMessage("[log] " + str);
        }
        public static void LogError(string str, params object[] args)
        {
            if (!SAAppConfig.IsLog)
                return;
            str = string.Format(str, args);
            LogError(str);
        }

        public static void Console(string str)
        {
            Log(str);
            ConsoleMessage("[log] " + str);
        }
        public static void ConsoleMessage(string str)
        {
            if (null == console)
            {
                //console = SALaunch.UIRootCamera.FindChild("ConsolePanel/Console").GetComponent<UILabel>();
                textList = SAManager.Instance.UIRootCamera.Find("ConsoleUI/Console").GetComponent<UITextList>();
            }
            textList.Add(str);
        }

        public static void RayHitByInput(SAGraphWorker graphWorker) {
            RayHitByVector(Input.mousePosition, graphWorker);
        }
        public static void RayHitByVector(Vector3 mousePosition, SAGraphWorker graphWorker) {
            Ray ray = SAManager.Instance.MainCamera.ScreenPointToRay(mousePosition);
            RaycastHit rayHit;
            if (Physics.Raycast(ray, out rayHit)) {
                GameObject hitObject = rayHit.collider.gameObject;
                graphWorker.dispatchEvent(ActionCollection.OnRayHit, hitObject);
            }
        }

        public static bool RayCastByMouse(out RaycastHit rayHit, string layer_name) {
            rayHit = new RaycastHit();
            if (!Input.GetMouseButton(0)) {
                return false;
            }

            LayerMask layer = 1 << LayerMask.NameToLayer(layer_name);
            Camera ui_camera = SAManager.Instance.UIRootCamera.GetComponent<Camera>();
            Ray ray = ui_camera.ScreenPointToRay(Input.mousePosition);
            return UnityEngine.Physics.Raycast(ray, out rayHit, 10, layer);
        }

        public static bool RayCastByTouch(out RaycastHit rayHit, string layer_name) {
            rayHit = new RaycastHit();
            if (Input.touchCount == 0) {
                return false;
            }

            LayerMask layer = 1 << LayerMask.NameToLayer(layer_name);
            Camera ui_camera = SAManager.Instance.UIRootCamera.GetComponent<Camera>();
            Ray ray = ui_camera.ScreenPointToRay(Input.GetTouch(0).position);
            return UnityEngine.Physics.Raycast(ray, out rayHit, 10, layer);
        }
    }
}