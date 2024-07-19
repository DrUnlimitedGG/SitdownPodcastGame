local event = game.ReplicatedStorage.Lighting.SpotlightOff

script.Parent.MouseButton1Click:Connect(function(player)
	event:FireServer(player)
end)