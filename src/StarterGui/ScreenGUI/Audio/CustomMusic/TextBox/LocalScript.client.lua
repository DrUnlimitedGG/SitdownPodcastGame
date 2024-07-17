local id = script.Parent
local uis = game:GetService("UserInputService")

script.Parent.TextColor3 = Color3.new(255, 255, 255)

script.Parent:GetPropertyChangedSignal("Text"):Connect(function()
	
	uis.InputBegan:Connect(function(key)
		if key.KeyCode == Enum.KeyCode.Return then
			local text = script.Parent.Text
			game.ReplicatedStorage.Audio.CustomAudio:FireServer(text)
		end
	end)
	
end)