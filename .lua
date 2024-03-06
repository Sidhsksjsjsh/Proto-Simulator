local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4 - 10/03/2024")
local T1 = wndw:Tab("Main")
local T2 = wndw:Tab("Hatch")

local eggh = {}
local user = game.Players.LocalPlayer
local workspace = game:GetService("Workspace")

local args = {
    [1] = workspace["World0"]["Eggs"]["Level0"]
}

game:GetService("ReplicatedStorage")["HatchEgg"]:FireServer(unpack(args))

for i,v in pairs(workspace:GetChildren()) do
  if v.Name:find("World") then
    
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

T1:Dropdown("Select Egg level",eggh,function(value)
    print(value)
end)
