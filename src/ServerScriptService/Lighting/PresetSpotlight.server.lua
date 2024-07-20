local spotlights = game.Workspace.NewSpotlights
local module = require(game.ServerScriptService.CheckGroupRank)


game.ReplicatedStorage.Lighting.SpotlightOff.OnServerEvent:Connect(function(player)
	local isAllowed = module.CheckRank(player)
	if isAllowed then		
		if spotlights.isChanging.Value == false then
			spotlights.isChanging.Value = true

				for brightness = spotlights.LightLeft.Five.LFive.Brightness, 0, -0.1 do
					
					
					spotlights.LightLeft.Five.LFive.Brightness = brightness
				spotlights.LightLeft.Five.Transparency = spotlights.LightLeft.Five.Transparency + 0.02083333333
				
					spotlights.LightRight.Four.LFour.Brightness = brightness
				spotlights.LightRight.Four.Transparency = spotlights.LightLeft.Five.Transparency + 0.02083333333
				
					spotlights.LightMidRight.Three.LThree.Brightness = brightness
				spotlights.LightMidRight.Three.Transparency = spotlights.LightLeft.Five.Transparency + 0.02083333333
				
					spotlights.LightMid.Two.LTwo.Brightness = brightness
				spotlights.LightMid.Two.Transparency = spotlights.LightLeft.Five.Transparency + 0.02083333333
				
					spotlights.LightMidLeft.One.LOne.Brightness = brightness
				spotlights.LightMidLeft.One.Transparency = spotlights.LightLeft.Five.Transparency + 0.02083333333
				

					wait()
				end

			end

			spotlights.isChanging.Value = false
		elseif spotlights.isChanging.Value == true then
			print("Light on/off failed because lights are already changing!")
		end 
	
end)

game.ReplicatedStorage.Lighting.SpotlightOn.OnServerEvent:Connect(function(player)
	local isAllowed = module.CheckRank(player)
	if isAllowed then
		if spotlights.isChanging.Value == false then
			spotlights.isChanging.Value = true
			
			for brightness = spotlights.LightLeft.Five.LFive.Brightness, 4.8, 0.1 do
				spotlights.LightLeft.Five.LFive.Brightness = brightness
				spotlights.LightLeft.Five.Transparency = spotlights.LightLeft.Five.Transparency - 0.02083333333

				spotlights.LightRight.Four.LFour.Brightness = brightness
				spotlights.LightRight.Four.Transparency = spotlights.LightLeft.Five.Transparency - 0.02083333333

				spotlights.LightMidRight.Three.LThree.Brightness = brightness
				spotlights.LightMidRight.Three.Transparency = spotlights.LightLeft.Five.Transparency - 0.02083333333

				spotlights.LightMid.Two.LTwo.Brightness = brightness
				spotlights.LightMid.Two.Transparency = spotlights.LightLeft.Five.Transparency - 0.02083333333

				spotlights.LightMidLeft.One.LOne.Brightness = brightness
				spotlights.LightMidLeft.One.Transparency = spotlights.LightLeft.Five.Transparency - 0.02083333333

				wait()
			end
			
			spotlights.isChanging.Value = false
		elseif spotlights.isChanging.Value == true then
			print("Light on/off failed because lights are already changing!")
		end 
	end
end)
