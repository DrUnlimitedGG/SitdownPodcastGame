local event = game.ReplicatedStorage.Audio.IsMusicPlaying
local module = require(game.ServerScriptService.CheckGroupRank)


local function checkVal(player)
	local isAllowed = module.CheckRank(player)
	if isAllowed then
		return game.ServerStorage.IsMusicPlaying.Value
	end
end

event.OnServerInvoke = checkVal