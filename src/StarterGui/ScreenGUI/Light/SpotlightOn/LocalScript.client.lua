local event = game.ReplicatedStorage.Lighting.SpotlightOn

script.Parent.MouseButton1Click:Connect(function(player)
	event:FireServer(player)
end)