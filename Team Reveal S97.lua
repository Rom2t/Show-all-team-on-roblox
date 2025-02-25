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
_ = liaison de deux termes, ex: US_TL_CF signifie UiStroke_TextLabel_ChargementFrame
]]

local TS = game:GetService("TweenService")

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
	
	for index, plr in game.Players:GetChildren() do
		local child = Gui.TemplateFrame:Clone()
		child.Parent = SF2_SF
		child.Visible = true
		child.Name = plr.Name
		child.TextButton.Text = plr.Name
		child.ImageLabel.Image = game.Players:GetUserThumbnailAsync(plr.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
		child.TextButton.MouseButton1Click:Connect(function()
			plrCam.CameraSubject = game.Players[child.Name].Character
		end)
		wait(.5)
	end
	
	TL_CF.Text = "Chargement finit."
	canLoad = true
end

for c = 3, 0, -1 do
	wait(1)
	TL_CF.Text = "Chargement du cheat, veuillez attendre ".. c .." secs..."
end

LoadCheat()

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
