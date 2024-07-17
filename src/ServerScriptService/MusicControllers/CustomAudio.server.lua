local event = game.ReplicatedStorage.Audio.CustomAudio
local module = require(game.ServerScriptService.CheckGroupRank)


local custom = Instance.new("Sound")
custom.Name = "CustomSong"
custom.Looped = false
custom.Parent = game.Workspace

local CustomSong = game.Workspace:WaitForChild("CustomSong")


event.OnServerEvent:Connect(function(player, text)
	print("received remote")
	print(player)
	print(text)
	local isAllowed = module.CheckRank(player)
	if isAllowed then
		if game.ServerStorage.IsMusicPlaying.Value == false then
			
			print("hello")
			print(text)
			game.Workspace:WaitForChild("Background"):Pause()
			game.ServerStorage.IsMusicPlaying.Value = true
			
			local success, err = pcall(function(player)
				CustomSong.SoundId = "rbxassetid://"..text
				CustomSong:Play()
			end)
			
			if success then
				print("Playing song!")
			elseif err then
				game.Workspace.Background:Resume()
				game.ServerStorage.IsMusicPlaying.Value = false
			end
			

			while true do
				if CustomSong.IsPlaying == false then
					wait(1.5)
					
					game.ServerStorage.IsMusicPlaying.Value = false
					CustomSong:Stop()
					game.Workspace.Background:Resume()

					
				end

				wait(1)
			end
		elseif game.ServerStorage.IsMusicPlaying.Value == true then
			print("Ignoring change until this one is DONE.")
		end
	end
end)
