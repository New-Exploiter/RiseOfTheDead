local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local RunService = game:GetService("RunService")
local speaker = game.Players.LocalPlayer

function hitbox()
    _G.hitbox = true
    while _G.hitbox == true do
        wait()
    for i,v in pairs(game:GetService("Workspace").Entity:GetChildren()) do
        if v:FindFirstChild("Zombie") ~= nil then
            if v:WaitForChild("Head", math.huge) ~= nil then
                v.Head.Size = Vector3.new(6,6,6)
                v.Head.CanCollide = false
                end
            end
        end
    end
end

function realhitbox()
    while _G.hitbox == false do
        wait()
    for i,v in pairs(game:GetService("Workspace").Entity:GetChildren()) do
        if v:FindFirstChild("Zombie") ~= nil then
            if v:WaitForChild("HumanoidRootPart", math.huge) ~= nil then
                v.Head.Size = Vector3.new(1,1,1)
                v.Head.CanCollide = false
                end
            end
        end
    end
end

function freeze()
    _G.freeze = true
    while _G.freeze == true do
    wait()
    for i,v in pairs(game:GetService("Workspace").Entity:GetChildren()) do
        if v:FindFirstChild("Zombie") ~= nil then
            if v:WaitForChild("HumanoidRootPart", math.huge) ~= nil then
                v.HumanoidRootPart.Anchored = true
                end
            end
        end
    end
end

function unfreeze()
    while _G.freeze == false do
    wait()
    for i,v in pairs(game:GetService("Workspace").Entity:GetChildren()) do
        if v:FindFirstChild("Zombie") ~= nil then
            if v:WaitForChild("HumanoidRootPart", math.huge) ~= nil then
                v.HumanoidRootPart.Anchored = false
                end
            end
        end
    end
end

function heal()
    if game.GameId == 65708455 then
        _G.heal = true
        wait()
        while _G.heal == true do
            wait ()
       if game:GetService("Workspace").Entity.Carlos:WaitForChild("HumanoidRootPart", math.huge) ~= nil then
        if speaker.Character.Humanoid.Health < 50 then
            local place = speaker.Character.HumanoidRootPart.CFrame
        speaker.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Entity.Carlos.HumanoidRootPart.CFrame + Vector3.new(3,0,0)
        else
            wait()
        if speaker.Character.Humanoid.Health == 90 then
            speaker.Character.HumanoidRootPart.CFrame = place
            _G.heal = false
        end
        end
       end
       end
    end
end

function box()
_G.hitboxb = 30,30
_G.box = true
while _G.box == true do
    wait()
    for i,v in pairs(game:GetService("Workspace").Entity:GetChildren()) do
        if v:FindFirstChild("Zombie") ~= nil then
            if v:WaitForChild("HumanoidRootPart", math.huge) ~= nil then
                v.HumanoidRootPart.Size = Vector3.new(_G.hitboxb, _G.hitboxb, _G.hitboxb)
                v.HumanoidRootPart.Transparency = 1
                v.HumanoidRootPart.CanCollide = false
            end
            end
        end
    end
end


local Window = Library.CreateLib("Rise Of The Dead", "Sentinel")
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Zombies")
--[ZOMBIE SECTION]
Section:NewToggle("Toggle Zombie Hitbox", "Off and On", function(state)
    if state then
        hitbox()
    else
        _G.hitbox = false
        realhitbox()
    end
end)


Section:NewToggle("Client Zombie Freeze", "Off and On", function(state)
    if state then
        freeze()
    else
        _G.freeze = false
        unfreeze()
    end
end)

Section:NewToggle("Melee Hitbox", "Off and On", function(state)
    if state then
        box()
    else
        _G.box = false
    end
end)

local Tab1 = Window:NewTab("Player")
local Section1 = Tab1:NewSection("PLAYER")

Section1:NewTextBox("TextboxText", "TextboxInfo", function(txt)
    game:GetService("RunService").Stepped:Connect(function()
        speaker.Character.Humanoid.WalkSpeed = s
    end)
end)

Section1:NewSlider("HipHeight", "Slide to Adjust", 24, 1.4, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = s
end)

local Tab2 = Window:NewTab("Extra")
local Section2 = Tab2:NewSection("Extra Functions")


Section2:NewToggle("Heal When Low HP", "Only Works For SafeHouse At The Moment", function(state)
    if state then
        heal()
    else
       _G.heal = false
    end
end)


