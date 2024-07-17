ids = {}
game.ServerStorage:WaitForChild("music")

function getLength(table)
	local length = 0
	for i, v in pairs(table) do
		length = length + 1
	end
	return length
end

function changeSong(songId)
	print(ids)
	for i, v in pairs(ids) do
		if v == songId then
			table.remove(ids,i)
			break
		end
	end
	print(ids)

	local randomIntNew = math.random(1,getLength(ids))
	return ids[randomIntNew]
end

for i, v in pairs(game.ServerStorage.music:GetChildren()) do
	table.insert(ids, v.SoundId)
	v.Looped = false
end

local randomInt = math.random(1,getLength(ids))

local songId = ids[randomInt]

local BGMusic = Instance.new("Sound")
BGMusic.Name = "Background"
BGMusic.SoundId = songId
BGMusic.Parent = game.Workspace

local Pause = Instance.new("BoolValue")
Pause.Name = "Paused"
Pause.Value = false
Pause.Parent = BGMusic

local song = game.Workspace.Background

game.Workspace:WaitForChild("Background").SoundId = songId
song:Play()
print("playing "..songId)
local newId

local adminPause = false

while true do
	adminPause = game.ServerStorage.IsMusicPlaying.Value
	
	if song.IsPlaying == false and adminPause == false then
		newId = changeSong(songId)
		game.Workspace.Background.SoundId = newId
		song:Play()
		table.insert(ids, songId)
		print("playing "..newId)
		songId = newId
	end
	wait(4)
end