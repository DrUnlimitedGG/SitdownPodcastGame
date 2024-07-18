script.Parent.ClickDetector.MouseClick:Connect(function(player)
	if player.Backpack:FindFirstChild("Special Cranberry Juice") == nil and player.Character:FindFirstChild("Special Cranberry Juice") == nil then
		local drink = game.ServerStorage["Special Cranberry Juice"]:Clone()
		drink.Parent = game.Players:FindFirstChild(player.Name).Backpack
	end
end)