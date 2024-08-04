local Players = game:GetService("Players")
local Stats = game:GetService("Stats")

local PerformanceStats = Stats.PerformanceStats
local Player = Players.LocalPlayer

local Balls = workspace:WaitForChild("Balls", 9e9)

local function IsAlive(Enemie)
  return (Enemie and Enemie:FindFirstChild("Humanoid") and Enemie.Humanoid.Health > 0)
end
local function GetNear()
  local Distance, Nearest = math.huge
  for _,plr in pairs(Players:GetPlayers()) do
    if plr ~= Player and IsAlive(plr.Character) then
      local plrPP1 = Player.Character and Player.Character.PrimaryPart
      local plrPP2 = plr.Character and plr.Character.PrimaryPart
      
      if plrPP1 and plrPP2 and (plrPP1.Position - plrPP2.Position).Magnitude <= Distance then
        Distance, Nearest = (plrPP1.Position - plrPP2.Position).Magnitude, plr
      end
    end
  end
  return Nearest
end
local function GetRealBall()
  for _,Ball in pairs(Balls:GetChildren()) do
    if Ball:GetAttribute("realBall") then
      return Ball
    end
  end
end
local function IsTarget(Ball)
  local target = Ball:GetAttribute("target")
  return target and target == Player.Name
end
local function GetPing()
  return PerformanceStats.Ping:GetValue()
end

return ({
  GetRealBall = GetRealBall,
  IsTarget = IsTarget,
  IsAlive = IsAlive,
  GetNear = GetNear,
  GetPing = GetPing
})
