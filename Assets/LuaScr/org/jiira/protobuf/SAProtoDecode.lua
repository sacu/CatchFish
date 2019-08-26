SAProtoDecode = {
	SAString = "string",
	SAInt = "int",
	SAFloat = "float",
	SABoolean = "boolean",
	SAArray = "array",
	isBooleanStr = "1",
	----------通用
	decodeAssign = "[:]",
	decodeSplit = "[,]",
	decodeEnd = "[}]",
	decodeArrayAssign = "[:][{]",
	decodeArrayEnd = "[}][,]",
	decodeStrEnd = "\"",
	classNameEnd = "[}][]]\"",
	-------------Lua
	luaSplitStr = "%[*%]",
	luaDecodeAssign = "%[:]",
	luaDecodeSplit = "%[,]",
	luaDecodeEnd = "%[}]",
	luaDecodeArrayAssign = "%[:]%[{]",
	luaDecodeArrayEnd = "%[}]%[,]",
	luaClassNameEnd = "%[}]%[]]\"",
	parsing = {}
}
SAProtoDecode.parsing = function (iostring)
	local x = 0
	local y = 0
	local len = #iostring
	local typeName
	local endName
	local fragmentStr
	while x < len do
		x = string.find(iostring, SAProtoDecode.decodeStrEnd, x) + 1 --查询类型名称首部
		if x == -1 then
			break--解析完毕
		end
		y = string.find(iostring, SAProtoDecode.decodeStrEnd, x) --查询类型名称尾部
		typeName = string.sub(iostring, x, y - 1) --获得类型
		endName = SAProtoDecode.luaClassNameEnd .. typeName .. SAProtoDecode.decodeStrEnd --获得类型结尾(如果解析内容中包含了自身类型，无法解析)
		x = y + #SAProtoDecode.decodeAssign + 1 --查询内容首部(跳过冒号)
		y = string.find(iostring, endName, x) --查询内容尾部
		fragmentStr = string.sub(iostring, x, y - 1) --获得内容
		endName = SAProtoDecode.classNameEnd .. typeName .. SAProtoDecode.decodeStrEnd
		x = y + #endName
		SAProtoDecode.setIOString(typeName, fragmentStr)
	end
end
ConvertModel = {x = 0, y = 0, len = 0, iostring = ""}
ConvertModel.setting = function(iostring, x, y)
	ConvertModel.len = #iostring
	ConvertModel.iostring = iostring
	ConvertModel.x = x
	ConvertModel.y = y
end
ConvertModel.read = function()
	ConvertModel.x = string.find(ConvertModel.iostring, SAProtoDecode.luaDecodeAssign, ConvertModel.x) + #SAProtoDecode.decodeAssign
	ConvertModel.y = string.find(ConvertModel.iostring, SAProtoDecode.luaDecodeSplit, ConvertModel.x) - 1
	local value = string.sub(ConvertModel.iostring, ConvertModel.x, ConvertModel.y)
	ConvertModel.x = ConvertModel.y + #SAProtoDecode.decodeEnd
	return value
end
ConvertModel.readInt = function()
	return tonumber(ConvertModel.read())
end
ConvertModel.readBoolean = function()
	return ConvertModel.read() == SAProtoDecode.isBooleanStr
end
ConvertModel.readFloat = function()
	return tonumber(ConvertModel.read())
end
ConvertModel.readString = function()
	return ConvertModel.read()
end
ConvertModel.readArray = function()
	ConvertModel.x = string.find(ConvertModel.iostring, SAProtoDecode.luaDecodeArrayAssign, ConvertModel.x) + #SAProtoDecode.decodeArrayAssign + 1
	ConvertModel.y = string.find(ConvertModel.iostring, SAProtoDecode.luaDecodeArrayEnd, ConvertModel.x)
	local value = string.sub(ConvertModel.iostring, ConvertModel.x - 1, ConvertModel.y - 1)
	ConvertModel.x = ConvertModel.y + #SAProtoDecode.decodeArrayEnd
	return value:split(SAProtoDecode.luaSplitStr)
end
ConvertModel.limit = function()
	return ConvertModel.x >= ConvertModel.len
end
ConvertModel.flip = function()
	ConvertModel.x = 0
	ConvertModel.y = 0
end
SAProtoClass = {}
function SAProtoClass()
	local class_type = { ctor = false}    -- 'ctor' field must be here
	class_type.new = function()
		local obj = { class = class_type }
		setmetatable(obj, { __index = SAProtoClass[class_type] })
		if class_type.ctor then
			class_type:ctor()
		end
		obj.class = class_type              -- must be here, because some class constructor change class property.
		return obj
	end
	return class_type
end
SAProtoDecode.setIOString = function(type, iostring)
	if SAProtoDecode.STFishType == type then
		STFish.parsing(iostring)
	elseif SAProtoDecode.STChapterType == type then
		STChapter.parsing(iostring)
	end
end
STFish = SAProtoClass()
SAProtoDecode.STFishType = "sTFish"
STFish.parsing = function(iostring)
	STFish.sTFishs = {}
	ConvertModel.setting(iostring, 0, 0)
	STFish.list = {}
	STFish.map = {}
	local i = 0
	while not ConvertModel.limit() do
		local sTFish= SAProtoClass()
		sTFish.Id = ConvertModel.readInt()
		sTFish.Life = ConvertModel.readInt()
		sTFish.Name = ConvertModel.readString()
		sTFish.Speed = ConvertModel.readFloat()
		sTFish.Diamond = ConvertModel.readInt()
		sTFish.Coin = ConvertModel.readInt()
		sTFish.Prop = ConvertModel.readInt()
		table.insert(STFish.list, i, sTFish)
		STFish.map[sTFish.Id] = sTFish
		i = i + 1
	end
end
STChapter = SAProtoClass()
SAProtoDecode.STChapterType = "sTChapter"
STChapter.parsing = function(iostring)
	STChapter.sTChapters = {}
	ConvertModel.setting(iostring, 0, 0)
	STChapter.list = {}
	STChapter.map = {}
	local i = 0
	while not ConvertModel.limit() do
		local sTChapter= SAProtoClass()
		sTChapter.Id = ConvertModel.readInt()
		sTChapter.SOF = ConvertModel.readArray()
		table.insert(STChapter.list, i, sTChapter)
		STChapter.map[sTChapter.Id] = sTChapter
		i = i + 1
	end
end