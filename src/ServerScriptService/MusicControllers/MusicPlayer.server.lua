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

