local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

OrionLib:MakeNotification({
	Name = "北风中心",
	Content = "正在加载 北风中心-密钥系统",
	Image = "rbxthumb://type=Asset&id=5107182114&w=150&h=150",
	Time = 5
})

local Window = OrionLib:MakeWindow({Name = "北风中心-密钥系统", HidePremium = false, SaveConfig = true, ConfigFolder = "BeiFengKeySystem", IntroText = "北风中心-密钥系统"})

local PlayersUserName = game.Players.LocalPlayer.Name

whitelist = {
	-- bc:参加过测试的创作者 b:参加过测试的玩家 c:创作者 w:白名单人员
	["CN_MIXUE"] = "bc",
}

local statement = Window:MakeTab({
	Name = "关于",
	Icon = "rbxassetid://14359155637",
	PremiumOnly = false
})

statement:AddParagraph("警告", "脚本不在指定游戏执行，会发生无法使用的情况，请明细")
statement:AddLabel("北风中心作者ROBLOX用户名：CN_MIXUE")
statement:AddLabel("联系方式 - 微信：XeroxA1000")
statement:AddLabel("联系方式 - QQ：204316214")

local key = Window:MakeTab({
	Name = "密钥",
	Icon = "rbxassetid://16132383094",
	PremiumOnly = false
})

local beta = key:AddLabel("测试人员：否")
local creator = key:AddLabel("创作者：否")
local white = key:AddLabel("白名单人员：否")

w=0
b=0
c=0

key:AddButton({
	Name = "确认",
	Callback = function()
		if w==1 or b==1 or c==1 then
			OrionLib:MakeNotification({
				Name = "北风中心",
				Content = "验证成功",
				Image = "rbxthumb://type=Asset&id=5107182114&w=150&h=150",
				Time = 3
			})
			loadstring(game:HttpGet(("https://raw.githubusercontent.com/UWUBeiFeng/Scripts/main/BeiFengCenter.lua"),true))()
		else 
			OrionLib:MakeNotification({
				Name = "北风中心",
				Content = "验证失败",
				Image = "rbxthumb://type=Asset&id=5107182114&w=150&h=150",
				Time = 3
			})
		end
	end    
})

if whitelist[PlayersUserName] == "bc" then
	beta:Set("测试人员：是")
	creator:Set("创作者：是")
	white:Set("白名单人员：否")
	w=0
	b=1
	c=1
elseif whitelist[PlayersUserName] == "b" then
	beta:Set("测试人员：是")
	creator:Set("创作者：否")
	white:Set("白名单人员：否")
	w=0
	b=1
	c=0
elseif whitelist[PlayersUserName] == "c" then
	beta:Set("测试人员：否")
	creator:Set("创作者：是")
	white:Set("白名单人员：否")
	w=0
	b=0
	c=1
elseif whitelist[PlayersUserName] == "w" then
	beta:Set("测试人员：否")
	creator:Set("创作者：否")
	white:Set("白名单人员：是")
	w=1
	b=0
	c=0
else
	beta:Set("测试人员：否")
	creator:Set("创作者：否")
	white:Set("白名单人员：否")
	w=0
	b=0
	c=0
end

OrionLib:Init()
