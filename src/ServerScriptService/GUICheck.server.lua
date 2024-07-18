local players = game:GetService("Players")
local module = require(game.ServerScriptService.CheckGroupRank)
local event = game.ReplicatedStorage.ShowGUI


players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		local event = game.ReplicatedStorage.ShowGUI

		local isAllowed = module.CheckRank(player)
		if isAllowed then
			warn("Enabled Light GUI for " .. player.Name)
			event:FireClient(player)
		end
	end)	
end)


