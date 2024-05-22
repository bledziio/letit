_G.auto4 = false

local task_defer = task.defer

function claimGifts()
    while _G.auto4 do
        for i = 1, 9 do
            local args = {
                [1] = {
                    ["Id"] = tostring(i)
                }
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("RewardService"):WaitForChild("RF"):WaitForChild("RequestCompletion"):InvokeServer(unpack(args))
            task.wait()
        end
        wait(20)
    end
end



local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/miroeramaa/TurtleLib/main/TurtleUiLib.lua"))()
local window = library:Window("Window")
window.Position = UDim2.new(0, 500, 0, 500)
-- Name of button, callback500

window:Button("Trial shop", function()
    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(game:GetService("Workspace").TrialShopZones.Part.Position))
end)

-- Name of the toggle, default state of the toggle, callback

window:Toggle("Claim Gifts", true, function(bool)
    _G.auto4 = bool
    task_defer(claimGifts())
end)

-- Name of slider, minimum value, maximum value, default value, callback
library:Keybind("P")
