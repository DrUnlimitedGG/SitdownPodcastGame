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

event.OnServerEvent:Connect(function(player, percentage)
	local isAllowed = module.CheckRank(player)
	if isAllowed then
		for i, v in pairs(game.Workspace:GetDescendants()) do
			if v:IsA("Light") then
				if (v.Parent.Parent.Name == "Spotlights") == false then
					if (v.Parent.Parent.Name == "FirePlace") == false then
						if (v.Parent.Parent.Name == "Television") == false then
							if (v.Parent.Parent.Name == "Backstage") == false then
								if (v.Name == "Ignore") == false then
									local brightness

									for i1, v1 in pairs(game.ServerStorage.LightDescs:GetChildren()) do
										if (v1.Name == v.Name) == true then
											brightness = v1.Value
											
											v.Brightness = v1.Value * percentage
										end
									end
									
							
									
									--v.Brightness = product
								end
							end	
						end	
					end
				end
			end
		end
	end
end)