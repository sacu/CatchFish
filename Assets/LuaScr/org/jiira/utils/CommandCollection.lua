require "org.jiira.protobuf.protobuf_pb"
CommandCollection = {}
CommandCollection.ProtoTypeEnum = {
	CLogin = 0, -- 
		CLoginStr = "CLogin.Lua",
	SUserData = 1, -- 
		SUserDataStr = "SUserData.Lua",
	SError = 2, -- 
		SErrorStr = "SError.Lua",
	SSingleUpdate = 3, -- 
		SSingleUpdateStr = "SSingleUpdate.Lua",
	CTest = 4, -- 
		CTestStr = "CTest.Lua",
	STest = 5, -- 
		STestStr = "STest.Lua",
	CHeart = 6, -- 
		CHeartStr = "CHeart.Lua",
}
CommandCollection.GameTypeEnum = {
	Leisure = 0, -- 休闲模式
		LeisureStr = "Leisure.Lua",
	Competition = 1, -- 竞技模式
		CompetitionStr = "Competition.Lua",
	Gay = 2, -- 约战
		GayStr = "Gay.Lua",
}
CommandCollection.RankTypeEnum = {
	Leisure = 0, -- 
		LeisureStr = "Leisure.Lua",
	Competition = 1, -- 
		CompetitionStr = "Competition.Lua",
	Gay = 2, -- 
		GayStr = "Gay.Lua",
}
CommandCollection.ChatTypeEnum = {
	World = 0, -- 
		WorldStr = "World.Lua",
	Organization = 1, -- 
		OrganizationStr = "Organization.Lua",
	Single = 2, -- 
		SingleStr = "Single.Lua",
}
CommandCollection.AccountTypeEnum = {
	Offline = 0, -- 
		OfflineStr = "Offline.Lua",
	Online = 1, -- 
		OnlineStr = "Online.Lua",
	Error = 2, -- 
		ErrorStr = "Error.Lua",
}
CommandCollection.TeamTypeEnum = {
	None = 0, -- 
		NoneStr = "None.Lua",
	Red = 1, -- 
		RedStr = "Red.Lua",
	Blue = 2, -- 
		BlueStr = "Blue.Lua",
}
CommandCollection.BigTypeEnum = {
	None = 0, -- 没有
		NoneStr = "None.Lua",
	Exp = 1, -- 经验
		ExpStr = "Exp.Lua",
	Currency = 2, -- 游戏币
		CurrencyStr = "Currency.Lua",
	Diamond = 3, -- 钻石
		DiamondStr = "Diamond.Lua",
	Card = 4, -- 卡牌类
		CardStr = "Card.Lua",
	Pack = 5, -- 奖励包
		PackStr = "Pack.Lua",
	Skin = 6, -- 皮肤类
		SkinStr = "Skin.Lua",
	Equip = 7, -- 装备类
		EquipStr = "Equip.Lua",
}
CommandCollection.SmallTypeEnum = {
	None = 0, -- 没有
		NoneStr = "None.Lua",
	Exp = 1, -- 经验
		ExpStr = "Exp.Lua",
	Currency = 2, -- 游戏币
		CurrencyStr = "Currency.Lua",
	Diamond = 3, -- 钻石
		DiamondStr = "Diamond.Lua",
	Card = 4, -- 普通卡牌
		CardStr = "Card.Lua",
	ADVCard = 5, -- 技能卡牌
		ADVCardStr = "ADVCard.Lua",
	BlinkCard = 6, -- 普通闪卡
		BlinkCardStr = "BlinkCard.Lua",
	ADVBlinkCard = 7, -- 技能闪卡
		ADVBlinkCardStr = "ADVBlinkCard.Lua",
	FreePack = 8, -- 免费奖励包
		FreePackStr = "FreePack.Lua",
	PayPack = 9, -- 付费奖励包
		PayPackStr = "PayPack.Lua",
	PopoSkin = 10, -- 聊天气泡皮肤
		PopoSkinStr = "PopoSkin.Lua",
	DialogueSkin = 11, -- 对白气泡皮肤
		DialogueSkinStr = "DialogueSkin.Lua",
	CardSkin = 12, -- 卡牌皮肤
		CardSkinStr = "CardSkin.Lua",
	ModelSkin = 13, -- 角色形象皮肤
		ModelSkinStr = "ModelSkin.Lua",
	SkillEquip = 14, -- 技能装备
		SkillEquipStr = "SkillEquip.Lua",
	AttributeEquip = 15, -- 属性装备
		AttributeEquipStr = "AttributeEquip.Lua",
}
CommandCollection.ErrorCodeEnum = {
	SocketDisconnectError = 0, -- 与服务器断开连接
		SocketDisconnectErrorStr = "SocketDisconnectError.Lua",
	UserNameOrPassWordError = 1, -- 用户名或密码错误
		UserNameOrPassWordErrorStr = "UserNameOrPassWordError.Lua",
	AccountNotFoundError = 2, -- 用户不存在
		AccountNotFoundErrorStr = "AccountNotFoundError.Lua",
	NickNameExistError = 3, -- 昵称已存在
		NickNameExistErrorStr = "NickNameExistError.Lua",
	AccountIsFoundError = 4, -- 用户已存在
		AccountIsFoundErrorStr = "AccountIsFoundError.Lua",
	AccountCreateError = 5, -- 用户创建失败
		AccountCreateErrorStr = "AccountCreateError.Lua",
	CardGroupError = 6, -- 卡组设置失败
		CardGroupErrorStr = "CardGroupError.Lua",
	BuyCardError = 7, -- 卡牌合成失败
		BuyCardErrorStr = "BuyCardError.Lua",
	SellCardError = 8, -- 卡牌分解失败
		SellCardErrorStr = "SellCardError.Lua",
	MatchRivalError = 9, -- 请求匹配失败
		MatchRivalErrorStr = "MatchRivalError.Lua",
	CancelMatchError = 10, -- 取消匹配失败
		CancelMatchErrorStr = "CancelMatchError.Lua",
	SettingDefaultCardGroupError = 11, -- 默认卡组设置失败
		SettingDefaultCardGroupErrorStr = "SettingDefaultCardGroupError.Lua",
	AccountError = 12, -- 帐号异常
		AccountErrorStr = "AccountError.Lua",
	RepeatLoginError = 13, -- 帐号已在登录状态
		RepeatLoginErrorStr = "RepeatLoginError.Lua",
	AccountOfflineError = 14, -- 目标用户是离线状态
		AccountOfflineErrorStr = "AccountOfflineError.Lua",
	BalanceIsNotEnoughError = 15, -- 余额不足
		BalanceIsNotEnoughErrorStr = "BalanceIsNotEnoughError.Lua",
	DataBaseError = 16, -- 数据库操作失败
		DataBaseErrorStr = "DataBaseError.Lua",
	CoolingTimeDidNoArriveError = 17, -- 冷却时间未结束
		CoolingTimeDidNoArriveErrorStr = "CoolingTimeDidNoArriveError.Lua",
	FirendListError = 18, -- 获取好友列表失败
		FirendListErrorStr = "FirendListError.Lua",
	FirendInfoError = 19, -- 获取好友信息失败
		FirendInfoErrorStr = "FirendInfoError.Lua",
	AddFirendError = 20, -- 添加好友失败
		AddFirendErrorStr = "AddFirendError.Lua",
	AddFirendToMysqlError = 21, -- 添加好友更新数据库失败
		AddFirendToMysqlErrorStr = "AddFirendToMysqlError.Lua",
	CurrencyToMysqlError = 22, -- 游戏币更新数据库失败
		CurrencyToMysqlErrorStr = "CurrencyToMysqlError.Lua",
	DiamondToMysqlError = 23, -- 钻石更新数据库失败
		DiamondToMysqlErrorStr = "DiamondToMysqlError.Lua",
	LackOfCurrencyError = 24, -- 游戏币不足
		LackOfCurrencyErrorStr = "LackOfCurrencyError.Lua",
	LackOfDiamondError = 25, -- 钻石不足
		LackOfDiamondErrorStr = "LackOfDiamondError.Lua",
	FightError = 26, -- 战斗异常
		FightErrorStr = "FightError.Lua",
	FightReadyError = 27, -- 战斗准备阶段异常
		FightReadyErrorStr = "FightReadyError.Lua",
	FightRoomCloseError = 28, -- 战斗房间已关闭
		FightRoomCloseErrorStr = "FightRoomCloseError.Lua",
	FightStepError = 29, -- 战斗步骤异常（出牌位置或不存在该手牌）
		FightStepErrorStr = "FightStepError.Lua",
	FightStepNoTeamError = 30, -- 错误的出牌队伍
		FightStepNoTeamErrorStr = "FightStepNoTeamError.Lua",
	BuySkinError = 31, -- 皮肤购买失败
		BuySkinErrorStr = "BuySkinError.Lua",
	BuyGiftError = 32, -- 礼包购买失败
		BuyGiftErrorStr = "BuyGiftError.Lua",
	SellSkinError = 33, -- 皮肤出售失败
		SellSkinErrorStr = "SellSkinError.Lua",
	SellGiftError = 34, -- 礼包出售失败
		SellGiftErrorStr = "SellGiftError.Lua",
	MailRemoveError = 35, -- 邮件删除失败
		MailRemoveErrorStr = "MailRemoveError.Lua",
	MailSendError = 36, -- 邮件发送失败
		MailSendErrorStr = "MailSendError.Lua",
	NotFoundCardListError = 37, -- 没有找到卡牌列表
		NotFoundCardListErrorStr = "NotFoundCardListError.Lua",
	NotFoundCardGroupError = 38, -- 没有找到默认卡组
		NotFoundCardGroupErrorStr = "NotFoundCardGroupError.Lua",
	CardGroupUseError = 39, -- 卡组装载失败
		CardGroupUseErrorStr = "CardGroupUseError.Lua",
	CardGroupUnUseError = 40, -- 卡组卸载失败
		CardGroupUnUseErrorStr = "CardGroupUnUseError.Lua",
	CardGroupEnditError = 41, -- 卡组编辑失败
		CardGroupEnditErrorStr = "CardGroupEnditError.Lua",
	CardNotFoundError = 42, -- 卡牌不存在
		CardNotFoundErrorStr = "CardNotFoundError.Lua",
	CardEquipUseError = 43, -- 卡牌装备装载失败
		CardEquipUseErrorStr = "CardEquipUseError.Lua",
	CardEquipUnUseError = 44, -- 卡牌装备卸载失败
		CardEquipUnUseErrorStr = "CardEquipUnUseError.Lua",
	NotFoundItemError = 45, -- 物品不存在
		NotFoundItemErrorStr = "NotFoundItemError.Lua",
	UpdateSkinError = 46, -- 皮肤更新失败
		UpdateSkinErrorStr = "UpdateSkinError.Lua",
	ItemListError = 47, -- 物品列表获取失败
		ItemListErrorStr = "ItemListError.Lua",
	UpdateHeadError = 48, -- 更新头像失败
		UpdateHeadErrorStr = "UpdateHeadError.Lua",
	ToDaySignInError = 49, -- 今天已经签到过了
		ToDaySignInErrorStr = "ToDaySignInError.Lua",
	MonthSignInError = 50, -- 本月签到已结束
		MonthSignInErrorStr = "MonthSignInError.Lua",
	SignInError = 51, -- 签到失败
		SignInErrorStr = "SignInError.Lua",
	LevelGiftInfoError = 52, -- 等级礼包信息错误
		LevelGiftInfoErrorStr = "LevelGiftInfoError.Lua",
	GiftNotFoundError = 53, -- 礼包不存在
		GiftNotFoundErrorStr = "GiftNotFoundError.Lua",
	UseGiftError = 54, -- 使用礼包错误
		UseGiftErrorStr = "UseGiftError.Lua",
	UseGiftMysqlError = 55, -- 使用礼包错误[Mysql]
		UseGiftMysqlErrorStr = "UseGiftMysqlError.Lua",
	GiftInfoError = 56, -- 礼包信息错误
		GiftInfoErrorStr = "GiftInfoError.Lua",
	GiftOpenError = 57, -- 打开礼包错误
		GiftOpenErrorStr = "GiftOpenError.Lua",
	ToDayReceiveError = 58, -- 今天已经领取过了
		ToDayReceiveErrorStr = "ToDayReceiveError.Lua",
	NoRepeatPurchaseError = 59, -- 不能重复购买
		NoRepeatPurchaseErrorStr = "NoRepeatPurchaseError.Lua",
	FundOverdueError = 60, -- 基金已过期
		FundOverdueErrorStr = "FundOverdueError.Lua",
	RefreshMissionError = 61, -- 没有可刷新的任务
		RefreshMissionErrorStr = "RefreshMissionError.Lua",
	MissionRefreshTimeToMysqlError = 62, -- 任务冷却时间更新数据库失败
		MissionRefreshTimeToMysqlErrorStr = "MissionRefreshTimeToMysqlError.Lua",
	GuideStepRefreshError = 63, -- 新手引导阶段更新失败
		GuideStepRefreshErrorStr = "GuideStepRefreshError.Lua",
	HookError = 64, -- 操你妈用外挂
		HookErrorStr = "HookError.Lua",
}
CommandCollection.SingleUpdateTypeEnum = {
	None = 0, -- 无
		NoneStr = "None.Lua",
	Exp = 1, -- 经验
		ExpStr = "Exp.Lua",
	Level = 2, -- 等级
		LevelStr = "Level.Lua",
	Currency = 3, -- 游戏币
		CurrencyStr = "Currency.Lua",
	Diamond = 4, -- 钻石
		DiamondStr = "Diamond.Lua",
	win = 5, -- 胜
		winStr = "win.Lua",
	fail = 6, -- 负
		failStr = "fail.Lua",
	dogfall = 7, -- 平
		dogfallStr = "dogfall.Lua",
	udSkin = 8, -- 穿戴的皮肤
		udSkinStr = "udSkin.Lua",
	Item = 9, -- 物品
		ItemStr = "Item.Lua",
	LevelGiftState = 10, -- 等级礼包
		LevelGiftStateStr = "LevelGiftState.Lua",
	FundDiamond = 11, -- 钻石基金日期更新
		FundDiamondStr = "FundDiamond.Lua",
	EndFundDiamondDay = 12, -- 钻石基金最后领取天数更新
		EndFundDiamondDayStr = "EndFundDiamondDay.Lua",
	FundCurrency = 13, -- 游戏币基金日期更新
		FundCurrencyStr = "FundCurrency.Lua",
	EndFundCurrencyDay = 14, -- 游戏币基金最后领取天数更新
		EndFundCurrencyDayStr = "EndFundCurrencyDay.Lua",
	SignIn = 15, -- 签到更新
		SignInStr = "SignIn.Lua",
	SignInCount = 16, -- 签到次数更新
		SignInCountStr = "SignInCount.Lua",
}
CommandCollection.BattleMessageTypeEnum = {
	Greet = 0, -- 问候
		GreetStr = "Greet.Lua",
	Amazing = 1, -- 惊叹
		AmazingStr = "Amazing.Lua",
	Happy = 2, -- 开心
		HappyStr = "Happy.Lua",
	Sad = 3, -- 悲伤
		SadStr = "Sad.Lua",
	Start = 4, -- 开场白
		StartStr = "Start.Lua",
}
CommandCollection.MissionTypeEnum = {
	Money = 0, -- 货币数量
		MoneyStr = "Money.Lua",
	CardCount = 1, -- 卡牌数量
		CardCountStr = "CardCount.Lua",
	WinCount = 2, -- 获胜次数
		WinCountStr = "WinCount.Lua",
	BattleCount = 3, -- 比赛次数
		BattleCountStr = "BattleCount.Lua",
	CardUseCount = 4, -- 放置卡牌次数
		CardUseCountStr = "CardUseCount.Lua",
	CardFlipCount = 5, -- 翻转卡牌次数
		CardFlipCountStr = "CardFlipCount.Lua",
	Consume = 6, -- 商城消费
		ConsumeStr = "Consume.Lua",
	PopCount = 7, -- 发气泡次数
		PopCountStr = "PopCount.Lua",
	FailCount = 8, -- 失败次数
		FailCountStr = "FailCount.Lua",
	WinContry = 9, -- 胜利国家限制
		WinContryStr = "WinContry.Lua",
}
CommandCollection.MissionConditionTypeEnum = {
	None = 0, -- 无
		NoneStr = "None.Lua",
	All = 1, -- 全部
		AllStr = "All.Lua",
	Money = 2, -- 任意货币
		MoneyStr = "Money.Lua",
	Currency = 3, -- 游戏币
		CurrencyStr = "Currency.Lua",
	Diamond = 4, -- 钻石
		DiamondStr = "Diamond.Lua",
	AllCard = 5, -- 任意卡牌
		AllCardStr = "AllCard.Lua",
	Card = 6, -- 普通卡牌
		CardStr = "Card.Lua",
	BlinkCard = 7, -- 闪卡
		BlinkCardStr = "BlinkCard.Lua",
	AllBattle = 8, -- 任意比赛
		AllBattleStr = "AllBattle.Lua",
	AllPVPBatle = 9, -- 任意PVP比赛
		AllPVPBatleStr = "AllPVPBatle.Lua",
	CompetitionPVPBatle = 10, -- 竞技PVP比赛
		CompetitionPVPBatleStr = "CompetitionPVPBatle.Lua",
	LeisurePVPBatle = 11, -- 休闲PVP比赛
		LeisurePVPBatleStr = "LeisurePVPBatle.Lua",
	AllPVEBatle = 12, -- 任意PVE比赛
		AllPVEBatleStr = "AllPVEBatle.Lua",
	TutorialPVEBatle = 13, -- 教学PVE比赛
		TutorialPVEBatleStr = "TutorialPVEBatle.Lua",
	TryPVEBatle = 14, -- 试玩PVE比赛
		TryPVEBatleStr = "TryPVEBatle.Lua",
	OrdinaryPVEBatle = 15, -- 普通PVE比赛
		OrdinaryPVEBatleStr = "OrdinaryPVEBatle.Lua",
}
CommandCollection.MissionNameTypeEnum = {
	Daily = 0, -- 每日
		DailyStr = "Daily.Lua",
	Achievement = 1, -- 成就
		AchievementStr = "Achievement.Lua",
}
CommandCollection.Sock = ".sock";
CommandCollection.DB_ID_BASETABLE = "gamedb";
CommandCollection.EnableAutocommit = true;
CommandCollection.SOCK_TYPE_LENGTH = 2;
CommandCollection.SOCK_CONTEXT_LENGTH = 2;
CommandCollection.SOCK_HEAD_LENGTH = 4;
CommandCollection.UPLEVEL = 1000;
CommandCollection.Exp = 33;
CommandCollection.Currency = 66;
CommandCollection.Diamond = 88;
CommandCollection.dataModel = {}
CommandCollection.getDataModel = function(body)
	local model = CommandCollection.dataModel[body.type]
	model:ParseFromString(body.context)
	return model
end
CommandCollection.dataModel[CommandCollection.ProtoTypeEnum.CLogin] = protobuf_pb.CLogin()
CommandCollection.dataModel[CommandCollection.ProtoTypeEnum.SUserData] = protobuf_pb.SUserData()
CommandCollection.dataModel[CommandCollection.ProtoTypeEnum.SError] = protobuf_pb.SError()
CommandCollection.dataModel[CommandCollection.ProtoTypeEnum.SSingleUpdate] = protobuf_pb.SSingleUpdate()
CommandCollection.dataModel[CommandCollection.ProtoTypeEnum.CTest] = protobuf_pb.CTest()
CommandCollection.dataModel[CommandCollection.ProtoTypeEnum.STest] = protobuf_pb.STest()
CommandCollection.dataModel[CommandCollection.ProtoTypeEnum.CHeart] = protobuf_pb.CHeart()
CommandCollection.getBigTypeEnum = function(itemId)
	if itemId >= 0 and itemId <= 0 then
		return CommandCollection.BigTypeEnum.None
	elseif itemId >= 33 and itemId <= 33 then
		return CommandCollection.BigTypeEnum.Exp
	elseif itemId >= 66 and itemId <= 66 then
		return CommandCollection.BigTypeEnum.Currency
	elseif itemId >= 88 and itemId <= 88 then
		return CommandCollection.BigTypeEnum.Diamond
	elseif itemId >= 1000 and itemId <= 4999 then
		return CommandCollection.BigTypeEnum.Card
	elseif itemId >= 5000 and itemId <= 5199 then
		return CommandCollection.BigTypeEnum.Pack
	elseif itemId >= 6000 and itemId <= 6399 then
		return CommandCollection.BigTypeEnum.Skin
	elseif itemId >= 7000 and itemId <= 9999 then
		return CommandCollection.BigTypeEnum.Equip
	else
		return CommandCollection.BigTypeEnum.None
	end
end
CommandCollection.getSmallTypeEnum = function(itemId)
	if itemId >= 0 and itemId <= 0 then
		return CommandCollection.SmallTypeEnum.None
	elseif itemId >= 33 and itemId <= 33 then
		return CommandCollection.SmallTypeEnum.Exp
	elseif itemId >= 66 and itemId <= 66 then
		return CommandCollection.SmallTypeEnum.Currency
	elseif itemId >= 88 and itemId <= 88 then
		return CommandCollection.SmallTypeEnum.Diamond
	elseif itemId >= 1000 and itemId <= 1999 then
		return CommandCollection.SmallTypeEnum.Card
	elseif itemId >= 2000 and itemId <= 2999 then
		return CommandCollection.SmallTypeEnum.ADVCard
	elseif itemId >= 3000 and itemId <= 3999 then
		return CommandCollection.SmallTypeEnum.BlinkCard
	elseif itemId >= 4000 and itemId <= 4999 then
		return CommandCollection.SmallTypeEnum.ADVBlinkCard
	elseif itemId >= 5000 and itemId <= 5099 then
		return CommandCollection.SmallTypeEnum.FreePack
	elseif itemId >= 5100 and itemId <= 5199 then
		return CommandCollection.SmallTypeEnum.PayPack
	elseif itemId >= 6000 and itemId <= 6099 then
		return CommandCollection.SmallTypeEnum.PopoSkin
	elseif itemId >= 6100 and itemId <= 6199 then
		return CommandCollection.SmallTypeEnum.DialogueSkin
	elseif itemId >= 6200 and itemId <= 6299 then
		return CommandCollection.SmallTypeEnum.CardSkin
	elseif itemId >= 6300 and itemId <= 6399 then
		return CommandCollection.SmallTypeEnum.ModelSkin
	elseif itemId >= 7000 and itemId <= 9499 then
		return CommandCollection.SmallTypeEnum.SkillEquip
	elseif itemId >= 9500 and itemId <= 9999 then
		return CommandCollection.SmallTypeEnum.AttributeEquip
	else
		return CommandCollection.SmallTypeEnum.None
	end
end