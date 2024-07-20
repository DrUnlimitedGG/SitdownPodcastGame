local event = game.ReplicatedStorage.Lighting.All
local module = require(game.ServerScriptService.CheckGroupRank)

for i, v in pairs(workspace:GetDescendants()) do
	if v.Name == "SpotLight" or v.Name == "PointLight" then
		if v.Parent.Position.Z < -88.025 then
			v.Name = "Ignore"
			warn("added part")
		end
	end
end

local values = Instance.new("Folder")
values.Name = "LightDescs"
values.Parent = game.ServerStorage

local index = 0

-- Generates NumberValues for the brightness of all lights, and it also names all of the lights in Workspace by their index
for i,v in pairs(game.Workspace:GetDescendants()) do
	if v.Name == "PointLight" or v.Name == "SpotLight" then
		index = index + 1
		v.Name = index

		local bright = Instance.new("NumberValue")
		bright.Value = v.Brightness
		bright.Name = index
		bright.Parent = game.ServerStorage.LightDescs
	end
end

