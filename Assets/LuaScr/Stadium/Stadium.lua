local graph;
local gameObject;
local transform;

--[[
26x26
]]
function new(gw)
	graph = gw
    gameObject = gw.SAGameObject
    transform = gw.SATransform
end
--0编辑 1单人 2双人
function onStart(obj)
	CS.UnityEngine.Debug.Log("statium："..obj);
	--铺地板
	local o = CS.UnityEngine.GameObject;
	local t = CS.Sacu.Utils.SACache.getModelWithName("Model/cn_tiles");
	local test = graph:InstantiateToTransform(t);
end

function onRegister()
end
