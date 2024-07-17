local playing = game.ReplicatedStorage.Audio.IsMusicPlaying:InvokeServer()
local event = game.ReplicatedStorage.Audio.ChangePlayingVal

script.Parent.MouseButton1Click:Connect(function()
	if playing == false then
		event:FireServer()
		
		game.ReplicatedStorage.Audio.PauseAudio:FireServer()
	elseif playing == true then
		event:FireServer()
		
		game.ReplicatedStorage.Audio.PauseAudio:FireServer()
	end
end)