local event = game.ReplicatedStorage.Audio.ChangeVolume
local module = require(game.ServerScriptService.CheckGroupRank)

local background = game.Workspace:WaitForChild("Background")

event.OnServerEvent:Connect(function(player, volume)
	local isAllowed = module.CheckRank(player)
	if isAllowed then
		background.Volume = volume
	end
end)