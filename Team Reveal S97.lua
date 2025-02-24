local TS = game:GetService("TweenService")

local Gui = Instance.new("ScreenGui")
Gui.Parent = game.Players.LocalPlayer.PlayerGui

local TextLabel = Instance.new("TextLabel")
TextLabel.Parent = Gui
TextLabel.Text = "Chargement... Veuillez attendre 60 secs..."
TextLabel.BackgroundTransparency = 0.5
TextLabel.BackgroundColor3 = Color3.fromRGB(0,0,0)
TextLabel.AnchorPoint = Vector2.new(0.5, 0)
TextLabel.Size = UDim2.new(0.2, 0, 0.08, 0)
TextLabel.Position = UDim2.new(0.48, 0, 0.1, 0)
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true

local UiCorner = Instance.new("UICorner")
UiCorner.Parent = TextLabel
UiCorner.CornerRadius = UDim.new(0.1, 0)

local UiStroke = Instance.new("UIStroke")
UiStroke.Parent = TextLabel
UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UiStroke.Thickness = 2

local ImageButton = Instance.new("ImageButton")
ImageButton.Parent = Gui
ImageButton.BackgroundTransparency = 1
ImageButton.Image = "rbxassetid://90667311847904"
ImageButton.ScaleType = Enum.ScaleType.Fit
ImageButton.AnchorPoint = Vector2.new(0.5, 0)
ImageButton.Size = UDim2.new(0.04, 0, 0.08, 0)
ImageButton.Position = UDim2.new(0.6, 0, 0.1, 0)

local canLoad = false

function LoadCheat()
	canLoad = false
	for c = 5, 0, -1 do
		wait(1)
		TextLabel.Text = "Chargement... Veuillez attendre ".. c .." secs..."
	end
	TextLabel.Text = "Chargement en cours..."
	wait(0.1)
	for count = 1, 3 do
		local TSinfo = TweenInfo.new(1.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
		local anim = TS:Create(ImageButton, TSinfo, {Rotation = 360})
		anim:Play()
		anim.Completed:Wait()
		ImageButton.Rotation = 0
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
	TextLabel.Text = "Chargement finit."
	canLoad = true
end

for c = 3, 0, -1 do
	wait(1)
	TextLabel.Text = "Chargement du cheat, veuillez attendre ".. c .." secs..."
end

LoadCheat()

ImageButton.MouseButton1Click:Connect(function()
	if canLoad then
		ImageButton.Active = false
		LoadCheat()
		ImageButton.Active = true
	end
end)
