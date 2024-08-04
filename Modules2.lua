local LocalPlayer = game:GetService('Players').LocalPlayer
local PerformanceStats = game:GetService('Stats').PerformanceStats

local module = {}


function module.alive(player)
    if player and player.Character then
        if player.Character:FindFirstChild('HumanoidRootPart') and player.Character:FindFirstChild('Humanoid') and player.Character.Humanoid.Health > 0 then
            return true
        end
    end
end


function module.ping()
    return PerformanceStats.Ping:GetValue()
end


return mmodule
