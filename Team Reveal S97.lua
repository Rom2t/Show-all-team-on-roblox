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
	
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Rom2t/Show-all-team-on-roblox/refs/heads/main/Freecam.lua"))()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Rom2t/Show-all-team-on-roblox/refs/heads/main/freecam2.lua"))()
	
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

RS.RenderStepped:Connect(function()
	local result = MouseRaycast()
	if result and result.Instance then
		if result.Instance.Parent:FindFirstChild("Humanoid") and game.Players:GetPlayerFromCharacter(result.Instance.Parent) ~= plr and game.Players:GetPlayerFromCharacter(result.Instance.Parent) ~= nil then
			IF.Visible = true
			CL_NF_SF2_IF.Text = game.Players:GetPlayerFromCharacter(result.Instance.Parent).Name
		else
			IF.Visible = false
		end
	end
end)
