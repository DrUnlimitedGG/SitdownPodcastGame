local event = game.ReplicatedStorage.Audio.ChangePlayingVal
local module = require(game.ServerScriptService.CheckGroupRank)

event.OnServerEvent:Connect(function(player)
	local isAllowed = module.CheckRank(player)
	if isAllowed then
		local value = game.ServerStorage.IsMusicPlaying.Value
		
		game.ServerStorage.IsMusicPlaying.Value = not game.ServerStorage.IsMusicPlaying.Value
	end
end)