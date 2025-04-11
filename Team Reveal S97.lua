--[[
TF = TemplateFrame
IL = ImageLabel
CF = ChargementFrame
TL = TextLabel
UC = UiCorner
US = UiStroke
IB = ImageButton
SF = SearchFrame
SF2 = ScrollingFrame
UILL = UIListLayout
IF = InformationFrame
IF2 = InventoryFrame
TF2 = TeamFreame2
NF = NameFrame
IDF = IDFrame
XPF = XPFrame
HF = HealthFrame
CL = ContentLabel
IL2 = InformationLabel
_ = liaison de deux termes, ex: US_TL_CF signifie UiStroke_TextLabel_ChargementFrame
]]

local TS = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local Selected = nil
local plr = game.Players.LocalPlayer

local Gui = Instance.new("ScreenGui")
Gui.Parent = game.Players.LocalPlayer.PlayerGui
Gui.Name = "Rom2t"

local plrCam = game.Workspace.CurrentCamera

local TF = Instance.new("Frame")
TF.Parent = Gui
TF.Name = "TemplateFrame"
TF.Visible = false
TF.Size = UDim2.new(1, 0, 0.011, 0)
TF.BackgroundTransparency = 1

local TB_TF = Instance.new("TextButton")
TB_TF.Parent = TF
TB_TF.BackgroundTransparency = 1
TB_TF.Position = UDim2.new(0.12, 0, 0, 0)
TB_TF.Size = UDim2.new(0.88, 0, 1, 0)
TB_TF.Text = ""
TB_TF.TextColor3 = Color3.fromRGB(255, 255, 255)
TB_TF.TextScaled = true

local IL_TF = Instance.new("ImageLabel")
IL_TF.Parent = TF
IL_TF.BackgroundTransparency = 1
IL_TF.Size = UDim2.new(0.12, 0, 1, 0)
IL_TF.ScaleType = Enum.ScaleType.Fit

local canLoad = false

-------------------------------------------------------------------------------------------

local CF = Instance.new("Frame")
CF.Parent = Gui
CF.BackgroundTransparency = 1
CF.AnchorPoint = Vector2.new(0.5, 0)
CF.Position = UDim2.new(0.5, 0, 0.1, 0)
CF.Size = UDim2.new(0.24, 0, 0.08, 0)
CF.Name = "ChargementFrame"

local TL_CF = Instance.new("TextLabel")
TL_CF.Parent = CF
TL_CF.Text = "Chargement... Veuillez attendre 60 secs..."
TL_CF.BackgroundTransparency = 0.5
TL_CF.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TL_CF.AnchorPoint = Vector2.new(0.5, 0)
TL_CF.Size = UDim2.new(0.82, 0, 1, 0)
TL_CF.Position = UDim2.new(0.41, 0, 0, 0)
TL_CF.TextColor3 = Color3.fromRGB(255, 255, 255)
TL_CF.TextScaled = true

local UC_TL_CF = Instance.new("UICorner")
UC_TL_CF.Parent = TL_CF
UC_TL_CF.CornerRadius = UDim.new(0.1, 0)

local US_TL_CF = Instance.new("UIStroke")
US_TL_CF.Parent = TL_CF
US_TL_CF.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
US_TL_CF.Thickness = 2

local IB_CF = Instance.new("ImageButton")
IB_CF.Parent = CF
IB_CF.BackgroundTransparency = 1
IB_CF.Image = "rbxassetid://90667311847904"
IB_CF.ScaleType = Enum.ScaleType.Fit
IB_CF.AnchorPoint = Vector2.new(0.5, 0)
IB_CF.Size = UDim2.new(0.18, 0, 1, 0)
IB_CF.Position = UDim2.new(0.91, 0, 0, 0)

-------------------------------------------------------------------------------------------

local SF = Instance.new("Frame")
SF.Parent = Gui
SF.BackgroundTransparency = 0.5
SF.AnchorPoint = Vector2.new(0.5, 0)
SF.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SF.Position = UDim2.new(0.19, 0, 0.225, 0)
SF.Size = UDim2.new(0.227, 0, 0.655, 0)
SF.Name = "SearchFrame"

local US_SF = Instance.new("UIStroke")
US_SF.Parent = SF
US_SF.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
US_SF.Thickness = 2

local TB_SF = Instance.new("TextBox")
TB_SF.Parent = SF
TB_SF.BackgroundTransparency = 0.9
TB_SF.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TB_SF.Size = UDim2.new(1, 0, 0.1, 0)
TB_SF.PlaceholderText = "Entres le pseudo d'un joueur..."
TB_SF.TextColor3 = Color3.fromRGB(255, 255, 255)
TB_SF.TextScaled = true
TB_SF.Text = ""

local US_TB_SF = Instance.new("UIStroke")
US_TB_SF.Parent = TB_SF
US_TB_SF.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
US_TB_SF.Thickness = 2

local SF2_SF = Instance.new("ScrollingFrame")
SF2_SF.Parent = SF
SF2_SF.BackgroundTransparency = 1
SF2_SF.Position = UDim2.new(0, 0, 0.1, 0)
SF2_SF.Size = UDim2.new(1, 0, 0.9, 0)
SF2_SF.CanvasSize = UDim2.new(0, 0, 7, 0)

local UILL_SF2_SF = Instance.new("UIListLayout")
UILL_SF2_SF.Parent = SF2_SF
UILL_SF2_SF.SortOrder = Enum.SortOrder.Name

-------------------------------------------------------------------------------------------

local IF = Instance.new("Frame")
IF.Parent = Gui
IF.BackgroundTransparency = 0.5
IF.AnchorPoint = Vector2.new(0.5, 0)
IF.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
IF.Position = UDim2.new(0.81, 0, 0.225, 0)
IF.Size = UDim2.new(0.227, 0, 0.655, 0)
IF.Visible = false
IF.Name = "InformationFrame"

local US_IF = Instance.new("UIStroke")
US_IF.Parent = IF
US_IF.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
US_IF.Thickness = 2

local SF2_IF = Instance.new("ScrollingFrame")
SF2_IF.Parent = IF
SF2_IF.BackgroundTransparency = 1
SF2_IF.Position = UDim2.new(0, 0, 0, 0)
SF2_IF.Size = UDim2.new(1, 0, 1, 0)
SF2_IF.CanvasSize = UDim2.new(0, 0, 1.5, 0)
SF2_IF.ScrollBarThickness = 0

local UILL_SF2_IF = Instance.new("UIListLayout")
UILL_SF2_IF.Parent = SF2_IF
UILL_SF2_IF.SortOrder = Enum.SortOrder.LayoutOrder

local NF_SF2_IF = Instance.new("Frame")
NF_SF2_IF.Parent = SF2_IF
NF_SF2_IF.BackgroundTransparency = 1
NF_SF2_IF.Size = UDim2.new(1, 0, 0.1, 0)
NF_SF2_IF.LayoutOrder = 1

local IL2_NF_SF2_IF = Instance.new("TextLabel")
IL2_NF_SF2_IF.Parent = NF_SF2_IF
IL2_NF_SF2_IF.BackgroundTransparency = 1
IL2_NF_SF2_IF.Size = UDim2.new(0.4, 0, 1, 0)
IL2_NF_SF2_IF.Font = Enum.Font.Nunito
IL2_NF_SF2_IF.Text = "Name:"
IL2_NF_SF2_IF.TextScaled = true
IL2_NF_SF2_IF.TextStrokeColor3 = Color3.new(255, 255, 255)
IL2_NF_SF2_IF.TextStrokeTransparency = 0
IL2_NF_SF2_IF.TextXAlignment = Enum.TextXAlignment.Left

local CL_NF_SF2_IF = Instance.new("TextLabel")
CL_NF_SF2_IF.Parent = NF_SF2_IF
CL_NF_SF2_IF.BackgroundTransparency = 1
CL_NF_SF2_IF.Position = UDim2.new(0.4, 0, 0, 0)
CL_NF_SF2_IF.Size = UDim2.new(0.6, 0, 1, 0)
CL_NF_SF2_IF.Font = Enum.Font.Nunito
CL_NF_SF2_IF.Text = "R0R021120"
CL_NF_SF2_IF.TextScaled = true

local IDF_SF2_IF = Instance.new("Frame")
IDF_SF2_IF.Parent = SF2_IF
IDF_SF2_IF.BackgroundTransparency = 1
IDF_SF2_IF.Size = UDim2.new(1, 0, 0.1, 0)
IDF_SF2_IF.LayoutOrder = 2

local IL2_IDF_SF2_IF = Instance.new("TextLabel")
IL2_IDF_SF2_IF.Parent = IDF_SF2_IF
IL2_IDF_SF2_IF.BackgroundTransparency = 1
IL2_IDF_SF2_IF.Size = UDim2.new(0.4, 0, 1, 0)
IL2_IDF_SF2_IF.Font = Enum.Font.Nunito
IL2_IDF_SF2_IF.Text = "ID:"
IL2_IDF_SF2_IF.TextScaled = true
IL2_IDF_SF2_IF.TextStrokeColor3 = Color3.new(255, 255, 255)
IL2_IDF_SF2_IF.TextStrokeTransparency = 0
IL2_IDF_SF2_IF.TextXAlignment = Enum.TextXAlignment.Left

local CL_IDF_SF2_IF = Instance.new("TextLabel")
CL_IDF_SF2_IF.Parent = IDF_SF2_IF
CL_IDF_SF2_IF.BackgroundTransparency = 1
CL_IDF_SF2_IF.Position = UDim2.new(0.4, 0, 0, 0)
CL_IDF_SF2_IF.Size = UDim2.new(0.6, 0, 1, 0)
CL_IDF_SF2_IF.Font = Enum.Font.Nunito
CL_IDF_SF2_IF.Text = "2547876350"
CL_IDF_SF2_IF.TextScaled = true

local TF2_SF2_IF = Instance.new("Frame")
TF2_SF2_IF.Parent = SF2_IF
TF2_SF2_IF.BackgroundTransparency = 1
TF2_SF2_IF.Size = UDim2.new(1, 0, 0.1, 0)
TF2_SF2_IF.LayoutOrder = 3

local IL2_TF2_SF2_IF = Instance.new("TextLabel")
IL2_TF2_SF2_IF.Parent = TF2_SF2_IF
IL2_TF2_SF2_IF.BackgroundTransparency = 1
IL2_TF2_SF2_IF.Size = UDim2.new(0.4, 0, 1, 0)
IL2_TF2_SF2_IF.Font = Enum.Font.Nunito
IL2_TF2_SF2_IF.Text = "Team:"
IL2_TF2_SF2_IF.TextScaled = true
IL2_TF2_SF2_IF.TextStrokeColor3 = Color3.new(255, 255, 255)
IL2_TF2_SF2_IF.TextStrokeTransparency = 0
IL2_TF2_SF2_IF.TextXAlignment = Enum.TextXAlignment.Left

local CL_TF2_SF2_IF = Instance.new("TextLabel")
CL_TF2_SF2_IF.Parent = TF2_SF2_IF
CL_TF2_SF2_IF.BackgroundTransparency = 1
CL_TF2_SF2_IF.Position = UDim2.new(0.4, 0, 0, 0)
CL_TF2_SF2_IF.Size = UDim2.new(0.6, 0, 1, 0)
CL_TF2_SF2_IF.Font = Enum.Font.Nunito
CL_TF2_SF2_IF.Text = "Classe-Delta"
CL_TF2_SF2_IF.TextScaled = true

local XPF_SF2_IF = Instance.new("Frame")
XPF_SF2_IF.Parent = SF2_IF
XPF_SF2_IF.BackgroundTransparency = 1
XPF_SF2_IF.Size = UDim2.new(1, 0, 0.1, 0)
XPF_SF2_IF.LayoutOrder = 4

local IL2_XPF_SF2_IF = Instance.new("TextLabel")
IL2_XPF_SF2_IF.Parent = XPF_SF2_IF
IL2_XPF_SF2_IF.BackgroundTransparency = 1
IL2_XPF_SF2_IF.Size = UDim2.new(0.4, 0, 1, 0)
IL2_XPF_SF2_IF.Font = Enum.Font.Nunito
IL2_XPF_SF2_IF.Text = "XP:"
IL2_XPF_SF2_IF.TextScaled = true
IL2_XPF_SF2_IF.TextStrokeColor3 = Color3.new(255, 255, 255)
IL2_XPF_SF2_IF.TextStrokeTransparency = 0
IL2_XPF_SF2_IF.TextXAlignment = Enum.TextXAlignment.Left

local CL_XPF_SF2_IF = Instance.new("TextLabel")
CL_XPF_SF2_IF.Parent = XPF_SF2_IF
CL_XPF_SF2_IF.BackgroundTransparency = 1
CL_XPF_SF2_IF.Position = UDim2.new(0.4, 0, 0, 0)
CL_XPF_SF2_IF.Size = UDim2.new(0.6, 0, 1, 0)
CL_XPF_SF2_IF.Font = Enum.Font.Nunito
CL_XPF_SF2_IF.Text = "900000"
CL_XPF_SF2_IF.TextScaled = true

local HF_SF2_IF = Instance.new("Frame")
HF_SF2_IF.Parent = SF2_IF
HF_SF2_IF.BackgroundTransparency = 1
HF_SF2_IF.Size = UDim2.new(1, 0, 0.1, 0)
HF_SF2_IF.LayoutOrder = 5

local IL2_HF_SF2_IF = Instance.new("TextLabel")
IL2_HF_SF2_IF.Parent = HF_SF2_IF
IL2_HF_SF2_IF.BackgroundTransparency = 1
IL2_HF_SF2_IF.Size = UDim2.new(0.4, 0, 1, 0)
IL2_HF_SF2_IF.Font = Enum.Font.Nunito
IL2_HF_SF2_IF.Text = "Health:"
IL2_HF_SF2_IF.TextScaled = true
IL2_HF_SF2_IF.TextStrokeColor3 = Color3.new(255, 255, 255)
IL2_HF_SF2_IF.TextStrokeTransparency = 0
IL2_HF_SF2_IF.TextXAlignment = Enum.TextXAlignment.Left

local CL_HF_SF2_IF = Instance.new("TextLabel")
CL_HF_SF2_IF.Parent = HF_SF2_IF
CL_HF_SF2_IF.BackgroundTransparency = 1
CL_HF_SF2_IF.Position = UDim2.new(0.4, 0, 0, 0)
CL_HF_SF2_IF.Size = UDim2.new(0.6, 0, 1, 0)
CL_HF_SF2_IF.Font = Enum.Font.Nunito
CL_HF_SF2_IF.Text = "100/100"
CL_HF_SF2_IF.TextScaled = true

-------------------------------------------------------------------------------------------

function LoadCheat()
	canLoad = false
	for c = 5, 0, -1 do
		wait(1)
		TL_CF.Text = "Chargement... Veuillez attendre ".. c .." secs..."
	end
	TL_CF.Text = "Chargement en cours..."
	wait(0.1)
	for count = 1, 3 do
		local TSinfo = TweenInfo.new(1.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
		local anim = TS:Create(CF.ImageButton, TSinfo, {Rotation = 360})
		anim:Play()
		anim.Completed:Wait()
		CF.ImageButton.Rotation = 0
		wait(0.3)
	end
	
	for _, i in game.Players:GetChildren() do
		print(i.Name, i.Team)
		if i ~= nil and game.workspace:FindFirstChild(i.Name) ~= nil then
			if game.Workspace:FindFirstChild(i.Name):FindFirstChild("Head") ~= nil then
				for a, b in game.workspace[i.Name].Head:GetChildren() do
					if b:IsA("BillboardGui") and b.Name == "BillboardGui" then
						b.Parent.Parent:FindFirstChild("Highlight"):Destroy()
						b:Destroy()
					end
				end
				
				local newHighlight = Instance.new("Highlight")
				newHighlight.Parent = game.Workspace[i.Name]
				newHighlight.FillTransparency = 0.8
				if game.Teams:FindFirstChild(tostring(i.Team)) then 
					newHighlight.FillColor = game.Teams[tostring(i.Team)].TeamColor.Color
				else 
					newHighlight.FillColor = Color3.fromRGB(225, 255, 255)
				end
				
				local newGui = Instance.new("BillboardGui")
				newGui.Parent = game.Workspace:FindFirstChild(i.Name):FindFirstChild("Head")
				newGui.AlwaysOnTop = false
				newGui.ExtentsOffset = Vector3.new(0, 3, 0)
				newGui.Size = UDim2.new(0, 200, 0, 50)
				newGui.MaxDistance = 75
				
				local text = Instance.new("TextLabel")
				text.Parent = newGui
				text.TextScaled = true
				text.BackgroundTransparency = 1
				text.Size = UDim2.new(1, 0, 1, 0)
				text.Text = tostring(i.Team)
				if game.Teams:FindFirstChild(tostring(i.Team)) then 
					text.TextColor3 = game.Teams[tostring(i.Team)].TeamColor.Color
				else 
					text.TextColor3 = Color3.fromRGB(225, 255, 255)
				end
			else
				print("Impossible de faire sa pour le joueur : " .. i.Name)
			end
		end
	end
	
	TL_CF.Text = "Chargement finit."
	canLoad = true
end

for c = 3, 0, -1 do
	wait(1)
	TL_CF.Text = "Chargement des ressources, veuillez patientez ".. c .." secs..."
end

local sound = Instance.new("Sound")
sound.Parent = Gui
sound.SoundId = "rbxassetid://6586979979"
sound.Volume = 1

function LoadPlayerTab()
	for index, plr in game.Players:GetChildren() do
		local child = Gui.TemplateFrame:Clone()
		child.Parent = SF2_SF
		child.Size = UDim2.new(1.5, 0, 0.022, 0)
		child.Name = plr.Name
		child.TextButton.Text = plr.Name
		child.ImageLabel.Image = game.Players:GetUserThumbnailAsync(plr.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)

		local TSInfo = TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
		local anim = TS:Create(child, TSInfo, {Size = UDim2.new(1, 0, 0.011, 0)})
		child.Visible = true
		anim:Play()
		sound:Play()
		anim.Completed:Wait()
	end
end

game.Players.PlayerAdded:Connect(function(NewPlayer)
	if SF2_SF:FindFirstChild(NewPlayer.Name) then
		
	else
		local child = Gui.TemplateFrame:Clone()
		child.Parent = SF2_SF
		child.Size = UDim2.new(1.5, 0, 0.022, 0)
		child.Name = NewPlayer.Name
		child.TextButton.Text = NewPlayer.Name
		child.ImageLabel.Image = game.Players:GetUserThumbnailAsync(NewPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)

		local TSInfo = TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
		local anim = TS:Create(child, TSInfo, {Size = UDim2.new(1, 0, 0.011, 0)})
		child.Visible = true
		anim:Play()
		sound:Play()
		anim.Completed:Wait()
	end
	
	NewPlayer.CharacterAdded:Connect(function(character)
		if canLoad then
			LoadCheat()
		end
	end)
end)

game.Players.PlayerRemoving:Connect(function(PlayerLeave)
	SF2_SF:FindFirstChild(PlayerLeave.Name):Destroy()
end)

LoadCheat()
LoadPlayerTab()

IB_CF.MouseButton1Click:Connect(function()
	if canLoad then
		IB_CF.Active = false
		LoadCheat()
		IB_CF.Active = true
	end
end)

--TB_TF.MouseButton2Click

TB_SF:GetPropertyChangedSignal("Text"):Connect(function()
	local InputText = string.lower(TB_SF.Text)
	for _, UserFrame in SF2_SF:GetChildren() do
		if UserFrame:IsA("Frame") then
			UserFrame.Visible = string.find(string.lower(UserFrame.Name), InputText, 1, true) and true or false
		end
	end
end)

for _, UserFrame in SF2_SF:GetChildren() do
	if UserFrame:IsA("Frame") then
		UserFrame.TextButton.MouseButton1Click:Connect(function()
			plrCam.CameraSubject = game.Players[UserFrame.Name].Character
			Selected = game.Players[UserFrame.Name].Character
		end)
	end
end

UIS.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.Up then
		if CF.Visible then
			CF.Visible = false
		else
			CF.Visible = true
		end
	elseif input.KeyCode == Enum.KeyCode.Left then
		if SF.Visible then
			SF.Visible = false
		else
			SF.Visible = true
		end
	end
	
	
	if input.KeyCode == Enum.KeyCode.T and UIS:IsKeyDown(Enum.KeyCode.LeftShift) then
		if Selected ~= nil then
			plr.Character:FindFirstChild("HumanoidRootPart").CFrame = Selected:FindFirstChild("HumanoidRootPart").CFrame + Vector3.new(0, 3, 0)
		end
	end
end)

local function MouseRaycast(model)
	local mousePosition = UIS:GetMouseLocation()
	local mouseRay = plrCam:ViewportPointToRay(mousePosition.X, mousePosition.Y)
	local raycastParams = RaycastParams.new()
	
	raycastParams.FilterType = Enum.RaycastFilterType.Exclude

	local raycastResult = workspace:Raycast(mouseRay.Origin, mouseRay.Direction * 1000, raycastParams)
	
	return raycastResult
end

local plrCible: Player = nil

function LoadInformation()
	CL_NF_SF2_IF.Text = plrCible.Name
	CL_IDF_SF2_IF.Text = plrCible.UserId
	CL_TF2_SF2_IF.Text = plrCible.Team.Name
	CL_XPF_SF2_IF.Text = plrCible:FindFirstChild("leaderstats"):FindFirstChild("xp").Value
	CL_HF_SF2_IF.Text = tostring(plrCible.Character:FindFirstChildWhichIsA("Humanoid").Health) .. "/" .. tostring(plrCible.Character:FindFirstChildWhichIsA("Humanoid").MaxHealth)
end

RS.RenderStepped:Connect(function()
	local result = MouseRaycast()
	if result and result.Instance then
		if result.Instance.Parent:FindFirstChild("Humanoid") and game.Players:GetPlayerFromCharacter(result.Instance.Parent) ~= plr and game.Players:GetPlayerFromCharacter(result.Instance.Parent) ~= nil then
			plrCible = game.Players:GetPlayerFromCharacter(result.Instance.Parent)
			IF.Visible = true
			LoadInformation()
		elseif result.Instance.Parent.Parent:FindFirstChild("Humanoid") and game.Players:GetPlayerFromCharacter(result.Instance.Parent.Parent) ~= plr and game.Players:GetPlayerFromCharacter(result.Instance.Parent.Parent) ~= nil then
			plrCible = game.Players:GetPlayerFromCharacter(result.Instance.Parent.Parent)
			IF.Visible = true
			LoadInformation()
		else
			IF.Visible = false
		end
	end
end)

------------------------------------------------------------------------
------------------------------------------------------------------------

-- FREECAM

------------------------------------------------------------------------
------------------------------------------------------------------------

local pi    = math.pi
local abs   = math.abs
local clamp = math.clamp
local exp   = math.exp
local rad   = math.rad
local sign  = math.sign
local sqrt  = math.sqrt
local tan   = math.tan

local ContextActionService = game:GetService("ContextActionService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Settings = UserSettings()
local GameSettings = Settings.GameSettings

local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	LocalPlayer = Players.LocalPlayer
end

local Camera = Workspace.CurrentCamera
Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	local newCamera = Workspace.CurrentCamera
	if newCamera then
		Camera = newCamera
	end
end)

local FFlagUserExitFreecamBreaksWithShiftlock
do
	local success, result = pcall(function()
		return UserSettings():IsUserFeatureEnabled("UserExitFreecamBreaksWithShiftlock")
	end)
	FFlagUserExitFreecamBreaksWithShiftlock = success and result
end

local FFlagUserShowGuiHideToggles
do
	local success, result = pcall(function()
		return UserSettings():IsUserFeatureEnabled("UserShowGuiHideToggles")
	end)
	FFlagUserShowGuiHideToggles = success and result
end

------------------------------------------------------------------------

local FREECAM_ENABLED_ATTRIBUTE_NAME = "FreecamEnabled"
local TOGGLE_INPUT_PRIORITY = Enum.ContextActionPriority.Low.Value
local INPUT_PRIORITY = Enum.ContextActionPriority.High.Value
local FREECAM_MACRO_KB = {Enum.KeyCode.LeftShift, Enum.KeyCode.P}

local NAV_GAIN = Vector3.new(1, 1, 1)*64
local PAN_GAIN = Vector2.new(0.75, 1)*8
local FOV_GAIN = 300

local PITCH_LIMIT = rad(90)

local VEL_STIFFNESS = 1.5
local PAN_STIFFNESS = 1.0
local FOV_STIFFNESS = 4.0

------------------------------------------------------------------------

local Spring = {} do
	Spring.__index = Spring

	function Spring.new(freq, pos)
		local self = setmetatable({}, Spring)
		self.f = freq
		self.p = pos
		self.v = pos*0
		return self
	end

	function Spring:Update(dt, goal)
		local f = self.f*2*pi
		local p0 = self.p
		local v0 = self.v

		local offset = goal - p0
		local decay = exp(-f*dt)

		local p1 = goal + (v0*dt - offset*(f*dt + 1))*decay
		local v1 = (f*dt*(offset*f - v0) + v0)*decay

		self.p = p1
		self.v = v1

		return p1
	end

	function Spring:Reset(pos)
		self.p = pos
		self.v = pos*0
	end
end

------------------------------------------------------------------------

local cameraPos = Vector3.new()
local cameraRot = Vector2.new()
local cameraFov = 0

local velSpring = Spring.new(VEL_STIFFNESS, Vector3.new())
local panSpring = Spring.new(PAN_STIFFNESS, Vector2.new())
local fovSpring = Spring.new(FOV_STIFFNESS, 0)

------------------------------------------------------------------------

local Input = {} do
	local thumbstickCurve do
		local K_CURVATURE = 2.0
		local K_DEADZONE = 0.15

		local function fCurve(x)
			return (exp(K_CURVATURE*x) - 1)/(exp(K_CURVATURE) - 1)
		end

		local function fDeadzone(x)
			return fCurve((x - K_DEADZONE)/(1 - K_DEADZONE))
		end

		function thumbstickCurve(x)
			return sign(x)*clamp(fDeadzone(abs(x)), 0, 1)
		end
	end

	local gamepad = {
		ButtonX = 0,
		ButtonY = 0,
		DPadDown = 0,
		DPadUp = 0,
		ButtonL2 = 0,
		ButtonR2 = 0,
		Thumbstick1 = Vector2.new(),
		Thumbstick2 = Vector2.new(),
	}

	local keyboard = {
		W = 0,
		A = 0,
		S = 0,
		D = 0,
		E = 0,
		Q = 0,
		U = 0,
		H = 0,
		J = 0,
		K = 0,
		I = 0,
		Y = 0,
		Up = 0,
		Down = 0,
		LeftShift = 0,
		RightShift = 0,
	}

	local mouse = {
		Delta = Vector2.new(),
		MouseWheel = 0,
	}

	local NAV_GAMEPAD_SPEED  = Vector3.new(1, 1, 1)
	local NAV_KEYBOARD_SPEED = Vector3.new(1, 1, 1)
	local PAN_MOUSE_SPEED    = Vector2.new(1, 1)*(pi/64)
	local PAN_GAMEPAD_SPEED  = Vector2.new(1, 1)*(pi/8)
	local FOV_WHEEL_SPEED    = 1.0
	local FOV_GAMEPAD_SPEED  = 0.25
	local NAV_ADJ_SPEED      = 0.75
	local NAV_SHIFT_MUL      = 0.25

	local navSpeed = 1

	function Input.Vel(dt)
		navSpeed = clamp(navSpeed + dt*(keyboard.Up - keyboard.Down)*NAV_ADJ_SPEED, 0.01, 4)

		local kGamepad = Vector3.new(
			thumbstickCurve(gamepad.Thumbstick1.X),
			thumbstickCurve(gamepad.ButtonR2) - thumbstickCurve(gamepad.ButtonL2),
			thumbstickCurve(-gamepad.Thumbstick1.Y)
		)*NAV_GAMEPAD_SPEED

		local kKeyboard = Vector3.new(
			keyboard.D - keyboard.A + keyboard.K - keyboard.H,
			keyboard.E - keyboard.Q + keyboard.I - keyboard.Y,
			keyboard.S - keyboard.W + keyboard.J - keyboard.U
		)*NAV_KEYBOARD_SPEED

		local shift = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift)

		return (kGamepad + kKeyboard)*(navSpeed*(shift and NAV_SHIFT_MUL or 1))
	end

	function Input.Pan(dt)
		local kGamepad = Vector2.new(
			thumbstickCurve(gamepad.Thumbstick2.Y),
			thumbstickCurve(-gamepad.Thumbstick2.X)
		)*PAN_GAMEPAD_SPEED
		local kMouse = mouse.Delta*PAN_MOUSE_SPEED
		mouse.Delta = Vector2.new()
		return kGamepad + kMouse
	end

	function Input.Fov(dt)
		local kGamepad = (gamepad.ButtonX - gamepad.ButtonY)*FOV_GAMEPAD_SPEED
		local kMouse = mouse.MouseWheel*FOV_WHEEL_SPEED
		mouse.MouseWheel = 0
		return kGamepad + kMouse
	end

	do
		local function Keypress(action, state, input)
			keyboard[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
			return Enum.ContextActionResult.Sink
		end

		local function GpButton(action, state, input)
			gamepad[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
			return Enum.ContextActionResult.Sink
		end

		local function MousePan(action, state, input)
			local delta = input.Delta
			mouse.Delta = Vector2.new(-delta.y, -delta.x)
			return Enum.ContextActionResult.Sink
		end

		local function Thumb(action, state, input)
			gamepad[input.KeyCode.Name] = input.Position
			return Enum.ContextActionResult.Sink
		end

		local function Trigger(action, state, input)
			gamepad[input.KeyCode.Name] = input.Position.z
			return Enum.ContextActionResult.Sink
		end

		local function MouseWheel(action, state, input)
			mouse[input.UserInputType.Name] = -input.Position.z
			return Enum.ContextActionResult.Sink
		end

		local function Zero(t)
			for k, v in pairs(t) do
				t[k] = v*0
			end
		end

		function Input.StartCapture()
			ContextActionService:BindActionAtPriority("FreecamKeyboard", Keypress, false, INPUT_PRIORITY,
				Enum.KeyCode.W, Enum.KeyCode.U,
				Enum.KeyCode.A, Enum.KeyCode.H,
				Enum.KeyCode.S, Enum.KeyCode.J,
				Enum.KeyCode.D, Enum.KeyCode.K,
				Enum.KeyCode.E, Enum.KeyCode.I,
				Enum.KeyCode.Q, Enum.KeyCode.Y,
				Enum.KeyCode.Up, Enum.KeyCode.Down
			)
			ContextActionService:BindActionAtPriority("FreecamMousePan",          MousePan,   false, INPUT_PRIORITY, Enum.UserInputType.MouseMovement)
			ContextActionService:BindActionAtPriority("FreecamMouseWheel",        MouseWheel, false, INPUT_PRIORITY, Enum.UserInputType.MouseWheel)
			ContextActionService:BindActionAtPriority("FreecamGamepadButton",     GpButton,   false, INPUT_PRIORITY, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY)
			ContextActionService:BindActionAtPriority("FreecamGamepadTrigger",    Trigger,    false, INPUT_PRIORITY, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2)
			ContextActionService:BindActionAtPriority("FreecamGamepadThumbstick", Thumb,      false, INPUT_PRIORITY, Enum.KeyCode.Thumbstick1, Enum.KeyCode.Thumbstick2)
		end

		function Input.StopCapture()
			navSpeed = 1
			Zero(gamepad)
			Zero(keyboard)
			Zero(mouse)
			ContextActionService:UnbindAction("FreecamKeyboard")
			ContextActionService:UnbindAction("FreecamMousePan")
			ContextActionService:UnbindAction("FreecamMouseWheel")
			ContextActionService:UnbindAction("FreecamGamepadButton")
			ContextActionService:UnbindAction("FreecamGamepadTrigger")
			ContextActionService:UnbindAction("FreecamGamepadThumbstick")
		end
	end
end

------------------------------------------------------------------------

local function StepFreecam(dt)
	local vel = velSpring:Update(dt, Input.Vel(dt))
	local pan = panSpring:Update(dt, Input.Pan(dt))
	local fov = fovSpring:Update(dt, Input.Fov(dt))

	local zoomFactor = sqrt(tan(rad(70/2))/tan(rad(cameraFov/2)))

	cameraFov = clamp(cameraFov + fov*FOV_GAIN*(dt/zoomFactor), 1, 120)
	cameraRot = cameraRot + pan*PAN_GAIN*(dt/zoomFactor)
	cameraRot = Vector2.new(clamp(cameraRot.x, -PITCH_LIMIT, PITCH_LIMIT), cameraRot.y%(2*pi))

	local cameraCFrame = CFrame.new(cameraPos)*CFrame.fromOrientation(cameraRot.x, cameraRot.y, 0)*CFrame.new(vel*NAV_GAIN*dt)
	cameraPos = cameraCFrame.p

	Camera.CFrame = cameraCFrame
	Camera.Focus = cameraCFrame 
	Camera.FieldOfView = cameraFov
end

local function CheckMouseLockAvailability()
	local devAllowsMouseLock = Players.LocalPlayer.DevEnableMouseLock
	local devMovementModeIsScriptable = Players.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable
	local userHasMouseLockModeEnabled = GameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch
	local userHasClickToMoveEnabled =  GameSettings.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove
	local MouseLockAvailable = devAllowsMouseLock and userHasMouseLockModeEnabled and not userHasClickToMoveEnabled and not devMovementModeIsScriptable

	return MouseLockAvailable
end

------------------------------------------------------------------------

local PlayerState = {} do
	local mouseBehavior
	local mouseIconEnabled
	local cameraType
	local cameraFocus
	local cameraCFrame
	local cameraFieldOfView
	local screenGuis = {}
	local coreGuis = {
		Backpack = true,
		Chat = true,
		Health = true,
		PlayerList = true,
	}
	local setCores = {
		BadgesNotificationsActive = true,
		PointsNotificationsActive = true,
	}

	-- Save state and set up for freecam
	function PlayerState.Push()
		for name in pairs(coreGuis) do
			coreGuis[name] = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType[name])
			StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], false)
		end
		for name in pairs(setCores) do
			setCores[name] = StarterGui:GetCore(name)
			StarterGui:SetCore(name, false)
		end
		local playergui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
		if playergui then
			for _, gui in pairs(playergui:GetChildren()) do
				if gui:IsA("ScreenGui") and gui.Enabled then
					screenGuis[#screenGuis + 1] = gui
					if gui.Name == "Rom2t" then
						CF.Visible = false
						SF.Visible = false
					else
						gui.Enabled = false
					end
				end
			end
		end

		cameraFieldOfView = Camera.FieldOfView
		Camera.FieldOfView = 70

		cameraType = Camera.CameraType
		Camera.CameraType = Enum.CameraType.Custom

		cameraCFrame = Camera.CFrame
		cameraFocus = Camera.Focus

		mouseIconEnabled = UserInputService.MouseIconEnabled
		UserInputService.MouseIconEnabled = true

		if FFlagUserExitFreecamBreaksWithShiftlock and CheckMouseLockAvailability() then
			mouseBehavior = Enum.MouseBehavior.LockCenter
		else
			mouseBehavior = UserInputService.MouseBehavior
		end
		UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
	end

	-- Restore state
	function PlayerState.Pop()
		for name, isEnabled in pairs(coreGuis) do
			StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], isEnabled)
		end
		for name, isEnabled in pairs(setCores) do
			StarterGui:SetCore(name, isEnabled)
		end
		for _, gui in pairs(screenGuis) do
			if gui.Parent then
				if gui.Name == "Rom2t" then
					CF.Visible = true
					SF.Visible = true
				else
					gui.Enabled = true
				end
			end
		end

		Camera.FieldOfView = cameraFieldOfView
		cameraFieldOfView = nil

		Camera.CameraType = cameraType
		cameraType = nil

		Camera.CFrame = cameraCFrame
		cameraCFrame = nil

		Camera.Focus = cameraFocus
		cameraFocus = nil

		UserInputService.MouseIconEnabled = mouseIconEnabled
		mouseIconEnabled = nil

		UserInputService.MouseBehavior = Enum.MouseBehavior.Default
		mouseBehavior = nil
	end
end

local function StartFreecam()
	if FFlagUserShowGuiHideToggles then
		script:SetAttribute(FREECAM_ENABLED_ATTRIBUTE_NAME, true)
	end

	local cameraCFrame = Camera.CFrame
	cameraRot = Vector2.new(cameraCFrame:toEulerAnglesYXZ())
	cameraPos = cameraCFrame.p
	cameraFov = Camera.FieldOfView

	velSpring:Reset(Vector3.new())
	panSpring:Reset(Vector2.new())
	fovSpring:Reset(0)

	PlayerState.Push()
	RunService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam)
	Input.StartCapture()
end

local function StopFreecam()
	if FFlagUserShowGuiHideToggles then
		script:SetAttribute(FREECAM_ENABLED_ATTRIBUTE_NAME, false)
	end

	Input.StopCapture()
	RunService:UnbindFromRenderStep("Freecam")
	PlayerState.Pop()
end

------------------------------------------------------------------------

do
	local enabled = false

	local function ToggleFreecam()
		if enabled then
			StopFreecam()
		else
			StartFreecam()
		end
		enabled = not enabled
	end

	local function CheckMacro(macro)
		for i = 1, #macro - 1 do
			if not UserInputService:IsKeyDown(macro[i]) then
				return
			end
		end
		ToggleFreecam()
	end

	local function HandleActivationInput(action, state, input)
		if state == Enum.UserInputState.Begin then
			if input.KeyCode == FREECAM_MACRO_KB[#FREECAM_MACRO_KB] then
				CheckMacro(FREECAM_MACRO_KB)
			end
		end
		return Enum.ContextActionResult.Pass
	end

	ContextActionService:BindActionAtPriority("FreecamToggle", HandleActivationInput, false, TOGGLE_INPUT_PRIORITY, FREECAM_MACRO_KB[#FREECAM_MACRO_KB])

	if FFlagUserShowGuiHideToggles then
		script:SetAttribute(FREECAM_ENABLED_ATTRIBUTE_NAME, enabled)
		script:GetAttributeChangedSignal(FREECAM_ENABLED_ATTRIBUTE_NAME):Connect(function()
			local attributeValue = script:GetAttribute(FREECAM_ENABLED_ATTRIBUTE_NAME)

			if typeof(attributeValue) ~= "boolean" then
				script:SetAttribute(FREECAM_ENABLED_ATTRIBUTE_NAME, enabled)
				return
			end

			-- If the attribute's value and `enabled` var don't match, pick attribute value as 
			-- source of truth
			if attributeValue ~= enabled then
				if attributeValue then
					StartFreecam()
					enabled = true
				else
					StopFreecam()
					enabled = false
				end
			end
		end)
	end
end

------------------------------------------------------------------------
------------------------------------------------------------------------

-- FREECAM (Shift+P)

------------------------------------------------------------------------
------------------------------------------------------------------------
