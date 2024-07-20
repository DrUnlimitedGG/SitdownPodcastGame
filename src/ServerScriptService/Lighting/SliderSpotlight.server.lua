local spotlights = game.Workspace:FindFirstChild("NewSpotlights")
local module = require(game.ServerScriptService.CheckGroupRank)


game.ReplicatedStorage.Lighting.Spotlight.OnServerEvent:Connect(function(player, percentage)
	local isAllowed = module.CheckRank(player)
	if isAllowed then
		--[[if spotlights.isChanging.Value == false then
			spotlights.isChanging.Value = true

			if spotlights.Enabled.Value == true then
				spotlights.Enabled.Value = false

				for brightness = spotlights.One.LOne.Brightness, 0, -0.1 do
					
			
					
					spotlights.One.LOne.Brightness = brightness
					spotlights.One.Transparency = spotlights.One.Transparency + 0.02083333333
					spotlights.Two.LTwo.Brightness = brightness
					spotlights.Two.Transparency = spotlights.One.Transparency + 0.02083333333
					spotlights.Three.LThree.Brightness = brightness
					spotlights.Three.Transparency = spotlights.One.Transparency + 0.02083333333
					spotlights.Four.LFour.Brightness = brightness
					spotlights.Four.Transparency = spotlights.One.Transparency + 0.02083333333
					spotlights.Five.LFive.Brightness = brightness
					spotlights.Five.Transparency = spotlights.One.Transparency + 0.02083333333

					wait()
				end
			elseif spotlights.Enabled.Value == false then
				spotlights.Enabled.Value = true

				for brightness = spotlights.One.LOne.Brightness, 4.8, 0.1 do
					spotlights.One.LOne.Brightness = brightness
					spotlights.One.Transparency = spotlights.One.Transparency - 0.02083333333
					spotlights.Two.LTwo.Brightness = brightness
					spotlights.Two.Transparency = spotlights.One.Transparency - 0.02083333333
					spotlights.Three.LThree.Brightness = brightness
					spotlights.Three.Transparency = spotlights.One.Transparency - 0.02083333333
					spotlights.Four.LFour.Brightness = brightness
					spotlights.Four.Transparency = spotlights.One.Transparency - 0.02083333333
					spotlights.Five.LFive.Brightness = brightness
					spotlights.Five.Transparency = spotlights.One.Transparency - 0.02083333333

					wait()
				end

			end

			spotlights.isChanging.Value = false
		elseif spotlights.isChanging.Value == true then
			print("Light on/off failed because lights are already changing!")
		end ]]--
		
		for i, v in pairs(spotlights:GetDescendants()) do
			if v.Name == "LFive" or v.Name == "LFour" or v.Name == "LThree" or v.Name == "LTwo" or v.Name == "LOne" then
				warn(v.Brightness)
				v.Brightness = percentage * 4.8
			elseif v:IsA("BasePart") and (v.Name == "One" or v.Name == "Two" or v.Name == "Three" or v.Name == "Four" or v.Name == "Five") then
				v.Transparency = 1 - percentage
			end
		end
		
	end
end)
