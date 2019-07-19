local graph;
local gameObject;
local transform;

function new(gw)
	graph = gw
    gameObject = gw.SAGameObject
    transform = gw.SATransform
end

function onStart()
	CS.Sacu.Utils.SAUtils.Log("AssetBundleRemote:onStart ... ")
end

function onRegister()
	CS.Sacu.Utils.SAUtils.Log("register")
end

function onRegisterComplete()
	--静态表解析
	--SAProtoDecode.parsing(CS.Sacu.Utils.SADataTable.Instance.iostring)
	CS.Sacu.Utils.SAUtils.Log("静态表解析完毕");
	CS.UnityEngine.Debug.Log(graph:getName());
	graph.factory:disposeFactory()
	CS.Sacu.Utils.SAManager.Instance:startFactory("LoginUIFactory")
end

function onRemove()
end

function onDispose()
end
