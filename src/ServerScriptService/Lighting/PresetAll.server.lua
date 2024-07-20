local TweenService = game:GetService("TweenService")
local AllEnabled = game.ServerStorage.AllLights.AllEnabled
local isChanging = game.ServerStorage.AllLights.IsChanging
local module = require(game.ServerScriptService.CheckGroupRank)


AllEnabled = true
isChanging = false

-- creates a folder to store all of light brightness values inside of ServerStorage
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

-- Function to brighten the lights
local function lightBrighten(light)
	local TweenInfo = TweenInfo.new(2)
	local name = light.Name
	local brightness
	
	-- Searches the folder for the specific light by name, then gets its brightness value for the tweening
	for i, v in pairs(game.ServerStorage.LightDescs:GetChildren()) do
		if (v.Name == name) == true then
			brightness = v.Value
		end
	end

	local tween = TweenService:Create(light,TweenInfo,{Brightness = brightness})

	tween:Play()
end

game.ReplicatedStorage.Lighting.AllOn.OnServerEvent:Connect(function(player)
	local isAllowed = module.CheckRank(player)
	if isAllowed then		
		if isChanging == false then
			isChanging = true
			
			AllEnabled = true
			print("Brightening lights!")
			for i, v in pairs(game.Workspace:GetDescendants()) do
				if v:IsA("Light") then
					if (v.Parent.Parent.Name == "Spotlights") == false then
						if (v.Parent.Parent.Name == "FirePlace") == false then
							if (v.Parent.Parent.Name == "Television") == false then
								if (v.Parent.Parent.Name == "Backstage") == false then
									if (v.Name == "Ignore") == false then
										task.spawn(lightBrighten,v)
									end
								end	
							end	
						end
					end
				end
			end
		end

		wait(2)
		isChanging = false
		
		
	elseif isChanging == true then
		print("DNC, already changing")
	end
end)

