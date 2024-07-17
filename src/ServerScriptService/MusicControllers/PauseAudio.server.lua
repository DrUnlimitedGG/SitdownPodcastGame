local event = game.ReplicatedStorage.Audio.PauseAudio
local module = require(game.ServerScriptService.CheckGroupRank)


local audio = game.Workspace:WaitForChild("Background")
local paused = audio:WaitForChild("Paused").Value


event.OnServerEvent:Connect(function(player)
	local isAllowed = module.CheckRank(player)
	if isAllowed then
		local toPause = game.ServerStorage.IsMusicPlaying.Value

		if toPause == true then
			paused = true
			audio:Pause()
		elseif toPause == false then
			paused = false
			audio:Resume()
		end
	end
end)