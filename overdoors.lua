--==================================================
-- THE OVERDOORS (FINAL)
-- Intro + Hardcore V4 + Crucifix + Seek Music
-- DELTA SAFE | ONE FILE | NO CONFLICT
--==================================================

-- SERVICES
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
		text.Font = Enum.Font.GothamBlack -- DOORS FONT
		text.TextScaled = true
		text.TextColor3 = Color3.fromRGB(255,255,255)
		text.TextTransparency = 1
		text.TextStrokeTransparency = 0.6
		text.TextStrokeColor3 = Color3.fromRGB(0,0,0)

		-- Fade In
		TweenService:Create(
			text,
			TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{TextTransparency = 0}
		):Play()

		task.wait(2)

		-- Fade Out
		TweenService:Create(
			text,
			TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
			{TextTransparency = 1}
		):Play()

		task.wait(1.2)
		gui:Destroy()
	end)
end)

--==================================================
-- DOORS STYLE BOTTOM NOTIFY
--==================================================
local function DoorsNotify(text)
	pcall(function()
		local gui = Instance.new("ScreenGui")
		gui.ResetOnSpawn = false
		gui.Parent = PlayerGui

		local frame = Instance.new("Frame", gui)
		frame.Size = UDim2.new(1,0,0,60)
		frame.Position = UDim2.new(0,0,1,0)
		frame.BackgroundColor3 = Color3.fromRGB(10,10,10)
		frame.BackgroundTransparency = 0.15
		frame.BorderSizePixel = 0

		local txt = Instance.new("TextLabel", frame)
		txt.Size = UDim2.new(1,-30,1,0)
		txt.Position = UDim2.new(0,15,0,0)
		txt.BackgroundTransparency = 1
		txt.Text = text
		txt.TextColor3 = Color3.fromRGB(255,255,255)
		txt.Font = Enum.Font.GothamBold
		txt.TextScaled = true
		txt.TextWrapped = true

		TweenService:Create(frame,
			TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
			{Position = UDim2.new(0,0,1,-60)}
		):Play()

		task.wait(4)

		TweenService:Create(frame,
			TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
			{Position = UDim2.new(0,0,1,0)}
		):Play()

		Debris:AddItem(gui,6)
	end)
end

--==================================================
-- GIVE CRUCIFIX
--==================================================
local function GiveCrucifix()
	pcall(function()
		if Player.Backpack:FindFirstChild("Crucifix") then return end

		local tool = Instance.new("Tool")
		tool.Name = "Crucifix"
		tool.RequiresHandle = true
		tool.CanBeDropped = false

		local handle = Instance.new("Part")
		handle.Name = "Handle"
		handle.Size = Vector3.new(1,3,0.3)
		handle.Material = Enum.Material.Wood
		handle.Color = Color3.fromRGB(90,70,50)
		handle.Parent = tool

		local mesh = Instance.new("SpecialMesh", handle)
		mesh.MeshType = Enum.MeshType.Brick
		mesh.Scale = Vector3.new(0.4,1,0.4)

		tool.Parent = Player.Backpack
	end)
end

--==================================================
-- LOAD HARDCORE V4 (SAFE)
--==================================================
task.spawn(function()
	task.wait(2)

	local ok, src = pcall(function()
		return game:HttpGet(
			"https://raw.githubusercontent.com/localplayerr/Doors-stuff/main/Hardcore%20v4%20recreate/main%20code"
		)
	end)

	if ok and src and #src > 50 then
		local f = loadstring(src)
		if f then
			pcall(f)
		end
	end
end)

--==================================================
-- SEEK MUSIC : HERE I COME
--==================================================
local SEEK_ID = "rbxassetid://78534559289195"

local function HookSeek(sound)
	if not sound:IsA("Sound") then return end
	local n = sound.Name:lower()
	if n:find("seek") or n:find("chase") then
		task.delay(0.1,function()
			pcall(function()
				sound.SoundId = SEEK_ID
				sound.Volume = 7
				sound.Looped = true
				if not sound.IsPlaying then
					sound:Play()
				end
			end)
		end)
	end
end

for _,v in ipairs(workspace:GetDescendants()) do
	HookSeek(v)
end
workspace.DescendantAdded:Connect(HookSeek)

--==================================================
-- START
--==================================================
task.spawn(function()
	task.wait(3)
	DoorsNotify("CHU be te liet script")
	GiveCrucifix()
end)

print("[THE OVERDOORS] Loaded | Delta Safe")
--==================================================
