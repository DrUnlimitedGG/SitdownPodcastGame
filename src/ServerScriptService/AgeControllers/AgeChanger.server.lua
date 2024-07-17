local event = game.ReplicatedStorage.AccountAge

event.OnServerEvent:Connect(function(player, percentage)
	if player:GetRankInGroup(15190011) == 255 or player:GetRankInGroup(15190011) == 254 or player.UserId == 41400612 then
		game.ServerStorage.AccountAge.Value = percentage + 1	
	end	
end)