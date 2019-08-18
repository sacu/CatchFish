local graph;
local gameObject;
local transform;

local cc = CS.Sacu.Utils.CommandCollection;
local enum = CS.Sacu.Utils.ProtoTypeEnum;
local su = CS.Sacu.Utils;
local ac = CS.Sacu.Collection.SAACollection;
local pte = CS.Sacu.Utils.ProtoTypeEnum;

function new(gw)
	graph = gw
    gameObject = gw.SAGameObject
    transform = gw.SATransform
end

function onStart(obj)
	CS.UnityEngine.Debug.Log("进入主界面");
	local userData = cc.getDataModel(pte.SUserData);
	local coinlbl = graph:getGameObjectByTypeName("CoinLbl","UILabel");
	local diamondlbl = graph:getGameObjectByTypeName("DiamondLbl","UILabel");
	coinlbl.text = userData.Coin
	diamondlbl.text = userData.Diamond
end

function onRegister()
	graph:addListenerButtonClick("GoBtn", testHandler)
	CS.UnityEngine.Debug.Log("注册工厂完毕开始");
	CS.UnityEngine.Debug.Log(enum.STest);
end

function testHandler(evt)
	CS.UnityEngine.Debug.Log("单人")
	graph.factory:disposeFactory()
	CS.Sacu.Utils.SAManager.Instance:startFactory("StadiumFactory")
end