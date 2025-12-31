--------------------------------------------------
-- OVERDOORS MODE (FINAL / DELTA SAFE / HARDCORE V4)
--------------------------------------------------

local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local Debris = game:GetService("Debris")
local StarterGui = game:GetService("StarterGui")
local P = Players.LocalPlayer

--------------------------------------------------
-- NOTIFICATION (2 DÒNG - SAFE)
--------------------------------------------------
task.spawn(function()
	task.wait(0.4)
	pcall(function()
		StarterGui:SetCore("SendNotification",{
			Title = "THE OVERDOORS",
			Text = "By CHUBE TE LIET",
			Duration = 4
		})
	end)

	task.wait(4.3)
	pcall(function()
		StarterGui:SetCore("SendNotification",{
			Title = "Remake",
			Text = "the one look so ugly",
			Duration = 4
		})
	end)
end)

--------------------------------------------------
-- INTRO : THE OVERDOORS (RED TEXT)
--------------------------------------------------
task.spawn(function()
	task.wait(0.8)

	local gui = Instance.new("ScreenGui")
	gui.IgnoreGuiInset = true
	gui.ResetOnSpawn = false
	gui.Parent = P:WaitForChild("PlayerGui")

	local txt = Instance.new("TextLabel")
	txt.Parent = gui
	txt.Size = UDim2.new(1,0,1,0)
	txt.BackgroundTransparency = 1
	txt.Text = "THE OVERDOORS"
	txt.Font = Enum.Font.GothamBlack
	txt.TextScaled = true
	txt.TextColor3 = Color3.fromRGB(255,0,0)
	txt.TextTransparency = 1
	txt.TextStrokeTransparency = 0.2

	for i=1,15 do
		txt.TextTransparency -= 0.07
		task.wait(0.03)
	end

	task.wait(2)

	for i=1,15 do
		txt.TextTransparency += 0.07
		task.wait(0.03)
	end

	gui:Destroy()
end)

--------------------------------------------------
-- LOAD HARDCORE V4 (SAFE)
--------------------------------------------------
task.spawn(function()
	task.wait(2)
	local ok,src = pcall(function()
		return game:HttpGet("https://raw.githubusercontent.com/localplayerr/Doors-stuff/main/Hardcore%20v4%20recreate/main%20code")
	end)
	if ok and src then
		pcall(loadstring(src))
	end
end)

--------------------------------------------------
-- SEEK MUSIC : HERE I COME
--------------------------------------------------
local SEEK_ID = "rbxassetid://78534559289195"

task.spawn(function()
	while task.wait(0.7) do
		for _,s in ipairs(workspace:GetDescendants()) do
			if s:IsA("Sound") then
				local n = s.Name:lower()
				if n:find("seek") or n:find("chase") then
					if s.SoundId ~= SEEK_ID then
						s.SoundId = SEEK_ID
						s.Volume = 7
						s.Looped = true
						pcall(function() s:Play() end)
					end
				end
			end
		end
	end
end)

--------------------------------------------------
-- ROOM DATA
--------------------------------------------------
local LatestRoom = RS:WaitForChild("GameData"):WaitForChild("LatestRoom")

--------------------------------------------------
-- CRUCIFIX GLOW IN CLOSET
--------------------------------------------------
local function glowCloset(roomNumber)
	local rooms = workspace:FindFirstChild("CurrentRooms")
	if not rooms then return end
	local room = rooms:FindFirstChild(tostring(roomNumber))
	if not room then return end

	for _,closet in ipairs(room:GetDescendants()) do
		if closet:IsA("Model") and closet.Name:lower():find("closet") then
			local part = closet:FindFirstChildWhichIsA("BasePart", true)
			if part and not part:FindFirstChild("OverdoorsGlow") then
				local g = Instance.new("PointLight", part)
				g.Name = "OverdoorsGlow"
				g.Color = Color3.fromRGB(0,255,200)
				g.Range = 16
				g.Brightness = 6
			end
			break
		end
	end
end

--------------------------------------------------
-- CRUCIFIX KILL (HARDCORE ENTITY)
--------------------------------------------------
local function hookCrucifix(tool)
	if not tool:IsA("Tool") then return end
	if tool.Name ~= "Crucifix" then return end
	if tool:FindFirstChild("OD") then return end
	Instance.new("BoolValue", tool).Name = "OD"

	tool.Activated:Connect(function()
		for _,m in ipairs(workspace:GetDescendants()) do
			if m:IsA("Model") then
				local n = m.Name:lower()
				if n:find("rush") or n:find("seek") or n:find("a60")
				or n:find("a90") or n:find("blitz") or n:find("depth") then
					pcall(function() m:Destroy() end)
				end
			end
		end
	end)
end

P.Backpack.ChildAdded:Connect(hookCrucifix)
P.CharacterAdded:Connect(function(c)
	c.ChildAdded:Connect(hookCrucifix)
end)

--------------------------------------------------
-- ROOM EVENT
--------------------------------------------------
LatestRoom:GetPropertyChangedSignal("Value"):Connect(function()
	if LatestRoom.Value > 10 then
		glowCloset(LatestRoom.Value)
	end
end)

--------------------------------------------------
-- RANDOM SCARY SCREAM (67%)
--------------------------------------------------
task.spawn(function()
	while task.wait(math.random(25,45)) do
		if math.random(1,100) <= 67 then
			local s = Instance.new("Sound")
			s.SoundId = "rbxassetid://129365607112965"
			s.Volume = 7

			local char = P.Character
			local root = char and char:FindFirstChild("HumanoidRootPart")
			s.Parent = root or workspace

			s:Play()
			Debris:AddItem(s,6)
		end
	end
end)

--------------------------------------------------
-- END : OVERDOORS
--------------------------------------------------
