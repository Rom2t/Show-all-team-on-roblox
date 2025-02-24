while wait(60) do
	for _, i in game.Players:GetChildren() do
		print(i.Name, i.Team)
		if i ~= nil and game.workspace:FindFirstChild(i.Name) ~= nil then
			if game.Workspace:FindFirstChild(i.Name):FindFirstChild("Head") ~= nil then
				for a, b in game.workspace[i.Name].Head:GetChildren() do
					if b:IsA("BillboardGui") and b.Name == "BillboardGui" then
						b:Destroy()
					end
				end
				local newHighlight = Instance.new("Highlight")
				newHighlight.Parent = game.Workspace[i.Name]
				newHighlight.FillColor = game.Teams[tostring(i.Team)].TeamColor.Color
				newHighlight.FillTransparency = 0.8
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
				text.TextColor3 = game.Teams[tostring(i.Team)].TeamColor.Color
			else
				print("Impossible de faire sa pour le joueur : " .. i.Name)
			end
		end
	end
end
