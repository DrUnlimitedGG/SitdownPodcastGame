local sound = game.Workspace:FindFirstChild("Background")

local SoundId = sound.SoundId:match("%d+")
local asset

while true do
	local paused = game.ReplicatedStorage.Audio.IsMusicPlaying:InvokeServer()

	if paused == false then
		local success, err = pcall(function()
			 asset = game:GetService("MarketplaceService"):GetProductInfo(SoundId)
		end)
		
		if success then
			script.Parent.Text = "CURRENTLY PLAYING: "..asset.Name
		elseif err then
			script.Parent.Text = err
			warn(err)
		end
	elseif paused == true then
		script.Parent.Text = "PLAYER IS PAUSED!"
	end
	
	wait(3)
end




