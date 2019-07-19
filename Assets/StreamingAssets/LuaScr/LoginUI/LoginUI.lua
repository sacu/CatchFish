local graph;
local gameObject;
local transform;

local cc = CS.Sacu.Utils.CommandCollection;
local su = CS.Sacu.Utils.SAUtils;
local ac = CS.Sacu.Collection.SAACollection;
local pte = CS.Sacu.Utils.ProtoTypeEnum;
local proto = CS.org.jiira.protobuf;

function new(gw)
	graph = gw
    gameObject = gw.SAGameObject
    transform = gw.SATransform
end

function onStart(obj)
	CS.UnityEngine.Debug.Log("Login启动");
	graph:addEventDispatcherWithHandle(cc.Sock .. pte.SUserData:ToString(), "getUserInfoHandler")
end

function onRegister()
	graph:addListenerButtonClick("LoginBoard/SingleBtn", singleHandler)
	--CS.UnityEngine.Debug.Log(CommandCollection.ProtoTypeEnum.STest)
	CS.UnityEngine.Debug.Log("Login开始");
	CS.UnityEngine.Debug.Log(pte.STest);
end

function singleHandler(evt)
	local sock = CS.Sacu.Utils.IOCManager.Instance:getIOCDataWorker("Datas.SocketDataWorker")
	if sock:getConnection() then
		loginHandle()
	else
		connectHandle()
	end
end

function loginHandle()
	local login = cc.getDataModel(pte.CLogin);
	su.Console("创建对象成功");
	login:SetUserName("你好");
	login:SetPassWord("test");
	local sock = CS.Sacu.Utils.IOCManager.Instance:getIOCDataWorker("Datas.SocketDataWorker")
	sock:sendMessage(pte.CLogin, login:Build():ToByteArray())
end

--连接服务器
function connectHandle()
	su.Console("连接服务器......")
	graph:addEventDispatcherWithHandle(cc.Sock .. ac.COMPLETE, "connectComplete")
	graph:addEventDispatcherWithHandle(cc.Sock .. ac.ERROR, "connectError")
	su.Console(cc.Sock .. ac.COMPLETE)

	local sock = CS.Sacu.Utils.IOCManager.Instance:getIOCDataWorker("Datas.SocketDataWorker")
	local version = CS.Sacu.Utils.SAGameVersion.Instance
	su.Console(version.ip .. ":" .. version.port)
	sock:connect(version.ip, version.port)--服务器
end

--服务器连接成功
function connectComplete(evt)
    su.Console("服务器连接成功")
    graph:removeEventDispatcher(cc.Sock .. ac.COMPLETE)
    graph:removeEventDispatcher(cc.Sock .. ac.ERROR)
    loginHandle()
end

--服务器连接失败
function connectError(evt)
    graph:removeEventDispatcher(cc.Sock .. ac.COMPLETE)
    graph:removeEventDispatcher(cc.Sock .. ac.ERROR)
	su.Log("网络环境不好,服务器连接失败,请重新连接")
end

function onRemove()
    graph:removeEventDispatcher(cc.Sock .. ac.COMPLETE)
    graph:removeEventDispatcher(cc.Sock .. ac.ERROR)
	graph:removeEventDispatcher(cc.Sock .. pte.SUserData:ToString())
end

function getUserInfoHandler(evt)
	local dao = evt.Body.bytes
	local userData = cc.getDataModel(pte.SUserData, dao);
	su.Console("登录成功")
	su.Log("code:" .. userData.Code)
end