script.Parent.ClickDetector.MouseClick:Connect(function(player)
	if player.Backpack:FindFirstChild("Water") == nil and player.Character:FindFirstChild("Water") == nil then
		local drink = game.ServerStorage["Water"]:Clone()
		drink.Parent = game.Players:FindFirstChild(player.Name).Backpack
	end
end)