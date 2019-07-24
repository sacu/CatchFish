local graph;
local gameObject;
local transform;

local width = CS.UnityEngine.Screen.width
local height = CS.UnityEngine.Screen.height

function new(gw)
	graph = gw
    gameObject = gw.SAGameObject
    transform = gw.SATransform
end
--0编辑 1单人 2双人
function onStart(obj)
	CS.UnityEngine.Debug.Log("开始捕鱼");

end

function onRegister()
end
