local event = game.ReplicatedStorage.Lighting.AllOn

script.Parent.MouseButton1Click:Connect(function(player)
	event:FireServer(player)
end)