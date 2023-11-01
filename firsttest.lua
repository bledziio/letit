  
_G.auto = false
_G.auto1 = false
_G.auto2 = false
_G.auto3 = false
_G.auto4 = false
_G.auto5 = false
_G.enemyval = "None"
_G.chosenenemy = 2
_G.enemydifficulty = 2.3
_G.eggzone = 6
_G.eggquant = 8
local task_defer = task.defer
local weaponattack2 = game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("GameService"):WaitForChild("RE"):WaitForChild("PlayerAttackStart")
local weaponattack = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.GameService.RE.PlayerAttackStart
local fightenemy = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.GameService.RF.RequestPlayerFightModeAttack
local requestcombat = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.GameService.RF.RequestAutoCombat
local requestforfeit = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.GameService.RF.RequestForfeit
local fightinit = game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.GameService.RF.RequestInitFight
local startfight = game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.GameService.RF.RequestStartFight
local openegg = game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.GameService.RF.RequestOpenCrate
local wheel = game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.GameService.RF.RequestWheelSpin
local requestchangezone = game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.GameService.RF.RequestChangeZone
local requestteleport = game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.GameService.RF.RequestTeleport
local buyzone = game:GetService("ReplicatedStorage").Packages["_Index"]["sleitnick_knit@1.4.7"].knit.Services.GameService.RF.RequestPurchaseZoneAccess
local REeventegg = game:GetService("ReplicatedStorage").Packages["_Index"]["sleitnick_knit@1.4.7"].knit.Services.GameService.RE.EventEggOpened
local REspinwheelreward = game:GetService("ReplicatedStorage").Packages["_Index"]["sleitnick_knit@1.4.7"].knit.Services.GameService.RE.WheelSpinReward

--game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.GameService.RE.PlayerAttackStart:FireServer()

--fightinit and requestcombat need args 1-4
--:InvokeServer()
function autoattack()
    while _G.auto do
        task.wait()
        weaponattack:FireServer()
	weaponattack2:FireServer()
    end
end
function autofight()
    while _G.auto1 do
        task.wait()
        fightenemy:InvokeServer()
    end
end
function selectenemy(currentOption)
    if currentOption == 1 then
        _G.chosenenemy = 1
    elseif currentOption == 2 then
        _G.chosenenemy = 2
    elseif currentOption == 3 then
        _G.chosenenemy = 3
    elseif currentOption == 4 then
        _G.chosenenemy = 4
    elseif currentOption == 0 then
        _G.chosenenemy = 0
    end
end
function normalcombat()
    while _G.auto2 do
        fightinit:InvokeServer(_G.chosenenemy)
        --task.wait()
        startfight:InvokeServer()
        weaponattack:FireServer()
        task.wait()
    end
end
function openmultieggs()
    while _G.auto4 do
        openegg:InvokeServer(_G.eggzone,_G.eggquant)
        task.wait(0.5)
    end
end
function teleporttozone(x)
    requestchangezone:InvokeServer(x)
    task.wait()
    requestteleport:InvokeServer(x)
    task.wait()
end
function spinwheel() 
    while _G.auto5 do
        wheel:InvokeServer(1)
        task.wait(30)
    end
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Titan X Sim", colors)
Window.Position = UDim2.new(0.3, 0, 0.2, 0)
local autofarm = Window:NewTab("Auto Farm")
local teleport = Window:NewTab("Teleport")
local config = Window:NewTab("Eggs")
local powerups = Window:NewTab("Power up")
local extra = Window:NewTab("Extra")
local autotoggles2 = autofarm:NewSection("AUTO")
local worlds = teleport:NewSection("Zones")
local eggconfig = config:NewSection("Egg Zone+ Amount")
local extralogo = extra:NewSection("EXTRA")
local powerupplayer = powerups:NewSection("power up")
local colors = {
    SchemeColor = Color3.fromRGB(51,153,255),
    Background = Color3.fromRGB(153,153,255),
    Header = Color3.fromRGB(0,128,255),
    TextColor = Color3.fromRGB(192,192,192),
    ElementColor = Color3.fromRGB(255,51,51)
}


autotoggles2:NewToggle(" Auto-Swing", nil, function(value)
	_G.auto = value
    task_defer(autoattack())
end)
autotoggles2:NewToggle(" Auto-Fight", nil, function(value)
    _G.auto1 = value
    task_defer(autofight())
end)

autotoggles2:NewToggle("Normal Combat", nil, function(value)
	_G.auto2 = value
    task_defer(normalcombat())
end)
autotoggles2:NewButton("Boss", nil, function()
    _G.chosenenemy = 4
end)
autotoggles2:NewButton("Creep", nil, function()
    _G.chosenenemy = 1
end)

worlds:NewButton("Robot", nil, function()
    teleporttozone(7)
end)
worlds:NewButton("Fire", nil, function()
    teleporttozone(6)
end)
worlds:NewButton("Chaos", nil, function()
    teleporttozone(5)
end)
worlds:NewButton("Forest", nil, function()
    teleporttozone(4)
end)
worlds:NewButton("Ice", nil, function()
    teleporttozone(3)
end)
worlds:NewButton("Desert", nil, function()
    teleporttozone(2)
end)
worlds:NewButton("Meadow", nil, function()
    teleporttozone(1)
end)


eggconfig:NewToggle("Open Eggs", nil, function(value)
    _G.auto4 = value
    task_defer(openmultieggs())
end)
eggconfig:NewDropdown("Egg Zone", nil, {7,6,5,4,3,2,1}, function(currentOption)
    _G.eggzone = currentOption
end)
eggconfig:NewDropdown("Egg Amount", nil, {1,8}, function(currentOption)
    _G.eggquant = currentOption
end)

extralogo:NewDropdown("buy zone", nil, {2,3,4,5,6}, function(currentOption)
    buyzone:InvokeServer(currentOption)
    task.wait(1)
end)
extralogo:NewButton("buy Best Weapon", nil, function()
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.GameService.RF.RequestUnlockWeapon:InvokeServer(5)
    task.wait(1)
end)
extralogo:NewButton("Rebirth", nil, function()
    game:GetService("ReplicatedStorage").Packages["_Index"]["sleitnick_knit@1.4.7"].knit.Services.GameService.RF.RequestPurchaseRebirth:InvokeServer()
    task.wait(1)
end)
extralogo:NewToggle("Auto Spin", nil, function(value)
    _G.auto5 = value
    task_defer(spinwheel())
end)
local dopowerup = game:GetService("ReplicatedStorage").Packages["_Index"]["sleitnick_knit@1.4.7"].knit.Services.GameService.RF.RequestUpgradePlayerStat
powerupplayer:NewButton("dmg", nil, function()
    dopowerup:InvokeServer("statPowerBoost")
    task.wait(1)
end)
powerupplayer:NewButton("wins", nil, function()
    dopowerup:InvokeServer("statGoldBoost")
    task.wait(1)
end)
powerupplayer:NewButton("luck", nil, function()
    dopowerup:InvokeServer("statLuckBoost")
    task.wait(1)
end)
powerupplayer:NewButton("pets", nil, function()
    dopowerup:InvokeServer("statPetEquip")
    task.wait(1)
end)
powerupplayer:NewButton("storage", nil, function()
    dopowerup:InvokeServer("statInvSize")
    task.wait(1)
end)
autotoggles2:NewButton("Friend Bonus", nil, function()
    game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.GameService.RF.RequestIncrementFriendCount:InvokeServer(5010962319)
    game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.GameService.RF.RequestIncrementFriendCount:InvokeServer(2019875828)
    game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.GameService.RF.RequestIncrementFriendCount:InvokeServer(1514104177)
    game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.GameService.RF.RequestIncrementFriendCount:InvokeServer(1458515703)
    game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.GameService.RF.RequestIncrementFriendCount:InvokeServer(66082360)
    game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.GameService.RF.RequestIncrementFriendCount:InvokeServer(1560112608)
    game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.GameService.RF.RequestIncrementFriendCount:InvokeServer(603264561)
    game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.GameService.RF.RequestIncrementFriendCount:InvokeServer(3166607335)
    game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.GameService.RF.RequestIncrementFriendCount:InvokeServer(4916734266)
    game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.GameService.RF.RequestIncrementFriendCount:InvokeServer(5136886355)
    game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.GameService.RF.RequestIncrementFriendCount:InvokeServer(4517219613)
    game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.GameService.RF.RequestIncrementFriendCount:InvokeServer(3605395426)
    game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.GameService.RF.RequestIncrementFriendCount:InvokeServer(1628001254)
    game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.GameService.RF.RequestIncrementFriendCount:InvokeServer(687338248)
    game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.GameService.RF.RequestIncrementFriendCount:InvokeServer(5145150569)
end)
-- Script generated by SimpleSpy - credits to exx#9394

local bb=game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
bb:CaptureController()
bb:ClickButton2(Vector2.new()) end)

--game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.GameService.RF.RequestCompleteQuest:InvokeServer()

-- Script generated by SimpleSpy - credits to exx#9394

--loadstring(game:HttpGet("https://raw.githubusercontent.com/bledziio/Discussion/099edd07dc7852daa858ef2f2fde5f848dcdd560/mylittle"))()
--loadstring(game:HttpGet("https://pastebin.com/raw/We87LDxW"))()
--loadstring(game:HttpGet("https://gist.githubusercontent.com/bledziio/42faf8a42dff5503e22c30a670eaf79d/raw/46834b40d2ca93599aa828b5024787be185dc7b9/nanaa"))()

