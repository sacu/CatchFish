local graph;
local gameObject;
local transform;

local enum = CS.Sacu.Utils.ProtoTypeEnum;
local su = CS.Sacu.Utils;
local ac = CS.Sacu.Collection.SAACollection;

function new(gw)
	graph = gw
    gameObject = gw.SAGameObject
    transform = gw.SATransform
end

function onStart(obj)
	CS.UnityEngine.Debug.Log("开始界面启动");
end

function onRegister()
	graph:addListenerButtonClick("SingleBtn", singleHandler)
	graph:addListenerButtonClick("DoubleBtn", doubleHandler)
	graph:addListenerButtonClick("EditBtn", editHandler)
	--CS.UnityEngine.Debug.Log(CommandCollection.ProtoTypeEnum.STest)
	CS.UnityEngine.Debug.Log("注册工厂完毕开始");
	CS.UnityEngine.Debug.Log(enum.STest);
end

function singleHandler(evt)
	CS.UnityEngine.Debug.Log("单人")
	graph.factory:disposeFactory()
	CS.Sacu.Utils.SAManager.Instance:startFactory("StadiumFactory",1)
end
function doubleHandler(evt)
	CS.UnityEngine.Debug.Log("双人")
	graph.factory:disposeFactory()
	CS.Sacu.Utils.SAManager.Instance:startFactory("StadiumFactory",2)
end
function editHandler(evt)
	CS.UnityEngine.Debug.Log("编辑")
	graph.factory:disposeFactory()
	CS.Sacu.Utils.SAManager.Instance:startFactory("StadiumFactory",0)
end