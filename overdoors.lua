--==================================================
-- THE OVERDOORS (FINAL)
-- Intro + Hardcore V4 + Crucifix + Seek Music
-- DELTA SAFE | ONE FILE | NO CONFLICT
--==================================================

-- SERVICES (FIXED - NO LINE BREAK BUG)
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Debris = game:GetService("Debris")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

--==================================================
-- INTRO : THE OVERDOORS (DOORS STYLE - CENTER)
--==================================================
task.spawn(function()
	task.wait(0.5)
	pcall(function()
		local gui = Instance.new("ScreenGui")
		gui.IgnoreGuiInset = true
		gui.ResetOnSpawn = false
		gui.Parent = PlayerGui

		local text = Instance.new("TextLabel")
		text.Parent = gui
		text.Size = UDim2.new(1,0,1,0)
		text.BackgroundTransparency = 1
		text.Text = "THE OVERDOORS"
		text.Font = Enum.Font.GothamBlack
		text.TextScaled = true
		text.TextColor3 = Color3.new(1,1,1)
		text.TextTransparency = 1
		text.TextStrokeTransparency = 0.6

		TweenService:Create(text,TweenInfo.new(1),{TextTransparency = 0}):Play()
		task.wait(2)
		TweenService:Create(text,TweenInfo.new(1),{TextTransparency = 1}):Play()
		task.wait(1.2)
		gui:Destroy()
	end)
end)

--==================================================
-- DOORS STYLE BOTTOM NOTIFY
--==================================================
local function DoorsNotify(msg)
	pcall(function()
		StarterGui:SetCore("SendNotification",{
			Title = "THE OVERDOORS",
			Text = msg,
			Duration = 4
		})
	end)
end

--==================================================
-- GIVE CRUCIFIX
--==================================================
local function GiveCrucifix()
	if Player.Backpack:FindFirstChild("Crucifix") then return end
	local tool = Instance.new("Tool")
	tool.Name = "Crucifix"
	tool.RequiresHandle = true
	tool.Parent = Player.Backpack

	local h = Instance.new("Part")
	h.Name = "Handle"
	h.Size = Vector3.new(1,3,0.3)
	h.Parent = tool
end

--==================================================
-- HARDCORE V4 (SAFE LOAD)
--==================================================
task.spawn(function()
	task.wait(2)
	local ok,src = pcall(function()
		return game:HttpGet("https://raw.githubusercontent.com/localplayerr/Doors-stuff/main/Hardcore%20v4%20recreate/main%20code")
	end)
	if ok and src then
		pcall(loadstring(src))
	end
end)

--==================================================
-- SEEK MUSIC
--==================================================
local SEEK_ID = "rbxassetid://78534559289195"
workspace.DescendantAdded:Connect(function(v)
	if v:IsA("Sound") and v.Name:lower():find("seek") then
		v.SoundId = SEEK_ID
		v.Volume = 7
		v.Looped = true
		v:Play()
	end
end)

--==================================================
-- START
--==================================================
task.wait(3)
DoorsNotify("CHU be te liet script")
GiveCrucifix()
print("[THE OVERDOORS] Loaded | Delta Safe")
		
