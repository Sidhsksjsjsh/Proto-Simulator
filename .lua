local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4 - 10/03/2024")
local T1 = wndw:Tab("Main")
local T2 = wndw:Tab("Hatch")

local eggh = {}
local W = {}
local user = game.Players.LocalPlayer
local workspace = game:GetService("Workspace")

--local args = {
--    [1] = workspace["World0"]["Eggs"]["Level0"]
--}

--game:GetService("ReplicatedStorage")["HatchEgg"]:FireServer(unpack(args))
--table.insert(tbl,v.Name)
for i,v in pairs(workspace:GetChildren()) do
  if v.Name:sub(1,5) == "World" then
    for index,variable in pairs(v["Eggs"]:GetChildren()) do
        if index == 1 or index == "1" then
            table.insert(eggh,variable.Name)
        end
    end
  end
end

for i,v in pairs(workspace:GetChildren()) do
  if v.Name:sub(1,5) == "World" then
    table.insert(W,v.Name)
  end
end

T1:Toggle("Auto swing",false,function(value)
    _G.autodmg = value
    while wait() do
      if _G.autodmg == false then break end
      game:GetService("ReplicatedStorage")["Click"]:FireServer(user.Character.HumanoidRootPart.Position * CFrame.new(0,0,-1.5))
    end
end)

T1:Toggle("Auto spin",false,function(value)
    _G.spin = value
    while wait() do
      if _G.spin == false then break end
      game:GetService("ReplicatedStorage")["Spin"]:InvokeServer()
    end
end)

T2:Dropdown("Select World ( world1 = Level1 )",W,function(value)
    _G.WLvl = value
end)

T2:Dropdown("Select Egg level",eggh,function(value)
    _G.egglvl = value
end)

T2:Toggle("Auto hatch",false,function(value)
    _G.hdc = value
    while wait() do
      if _G.hdc == false then break end
      game:GetService("ReplicatedStorage")["HatchEgg"]:FireServer(workspace[_G.WLvl]["Eggs"][_G.egglvl])
    end
end)
