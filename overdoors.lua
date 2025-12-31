--====================================================
-- THE OVERDOORS (FINAL)
-- Intro + Hardcore V4 + Crucifix + Seek Music
-- DELTA SAFE | ONE FILE | NO CONFLICT
--====================================================

if getgenv().OVERDOORS_LOADED then return end
getgenv().OVERDOORS_LOADED = true

-- SERVICES
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Debris = game:GetService("Debris")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

--====================================================
-- NOTIFICATION (DELTA SAFE)
local function notify(title,text,time)
    pcall(function()
        StarterGui:SetCore("SendNotification",{
            Title = title,
            Text = text,
            Duration = time or 4
        })
    end)
end

--====================================================
-- INTRO : THE OVERDOORS (DOORS STYLE)
task.spawn(function()
    task.wait(0.5)

    local gui = Instance.new("ScreenGui")
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false
    gui.Parent = PlayerGui

    local text = Instance.new("TextLabel")
    text.Parent = gui
    text.Size = UDim2.new(1,0,1,0)
    text.AnchorPoint = Vector2.new(0.5,0.5)
    text.Position = UDim2.new(0.5,0,0.5,0)
    text.BackgroundTransparency = 1
    text.Text = "THE OVERDOORS"
    text.Font = Enum.Font.GothamBlack
    text.TextScaled = true
    text.TextColor3 = Color3.fromRGB(255,255,255)
    text.TextTransparency = 1

    TweenService:Create(
        text,
        TweenInfo.new(1,Enum.EasingStyle.Quad),
        {TextTransparency = 0}
    ):Play()

    task.wait(2)

    TweenService:Create(
        text,
        TweenInfo.new(1),
        {TextTransparency = 1}
    ):Play()

    task.wait(1.2)
    gui:Destroy()
end)

--====================================================
-- BOOT NOTIFY
task.wait(0.8)
notify("THE OVERDOORS","CHU BE TE LIET SCRIPT",4)
task.wait(4.2)
notify("Hardcore Mode","HARDCORE V4 ENABLED",4)

--====================================================
-- SEEK MUSIC (HERE I COME)
task.spawn(function()
    task.wait(6)

    local s = Instance.new("Sound")
    s.SoundId = "rbxassetid://9125713501" -- Seek style music
    s.Volume = 2
    s.Looped = false
    s.Parent = SoundService
    s:Play()
    Debris:AddItem(s,25)
end)

--====================================================
-- CRUCIFIX (SAFE FAKE)
task.spawn(function()
    task.wait(8)
    notify("Crucifix","The light protects you...",4)
end)

--====================================================
-- HARDCORE V4 FLAG (SAFE)
getgenv().OVERDOORS_HARDCORE = true
