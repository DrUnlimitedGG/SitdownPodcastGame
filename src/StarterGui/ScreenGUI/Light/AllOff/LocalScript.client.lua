local event = game.ReplicatedStorage.Lighting.AllOff

script.Parent.MouseButton1Click:Connect(function(player)
	event:FireServer(player)
end)