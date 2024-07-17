
while true do
	local value = game.ServerStorage.AccountAge.Value
	
	game.Players.PlayerAdded:Connect(function(player)
		if player.AccountAge < value then
			player:Kick("Your account must be at least " ..value.." days to join!")
		end
	end)
	
	wait(1)
end