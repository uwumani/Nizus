local LocalPlayer = game:GetService('Players').LocalPlayer
local ReplicatedStorage = game:GetService('ReplicatedStorage')

local blade_ball_module = {}

local net = ReplicatedStorage.Packages._Index['sleitnick_net@0.1.0'].net

local parry_remote = nil

function blade_ball_module.get_ball(real_ball: boolean)
    for _, v in workspace.Balls:GetChildren() do
        if v:GetAttribute('realBall') == real_ball then
            return v
        end
    end
end

function blade_ball_module.parry(direction: Raycast, external: boolean)
    if external then
        local cf = workspace.CurrentCamera.CFrame
        local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cf:GetComponents()
     
        local args = {
            [1] = 0,
            [2] = CFrame.new(x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22),
            [3] = {},
            [4] = {
                [1] = workspace.CurrentCamera.ViewportSize.X,
                [2] = workspace.CurrentCamera.ViewportSize.Y
            },
            [5] = false
        } 
        parry_remote = parry_remote or game:GetService("SocialService"):WaitForChild("\n")
     
        if parry_remote then
            parry_remote:FireServer(unpack(args)) 
        end
    end
end


function blade_ball_module.claim_playtime_rewards()
    for _ = 1, 6 do
        net['RF/ClaimPlaytimeReward']:InvokeServer(_)        
    end
end


return blade_ball_module
