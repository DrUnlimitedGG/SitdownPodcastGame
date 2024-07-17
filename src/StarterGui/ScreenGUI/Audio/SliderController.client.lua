local uis = game:GetService("UserInputService")

local slider = script.Parent.Slider
local sliderButton = slider.SliderButton
local sliderDragging = false

sliderButton.MouseButton1Down:Connect(function()
	sliderDragging = true
end)

uis.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		sliderDragging = false
	end
end)

uis.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		if sliderDragging == true then
			local mouseLoc = uis:GetMouseLocation()
			local relativePos = mouseLoc - slider.AbsolutePosition
			local percentage = math.clamp(relativePos.X/slider.AbsoluteSize.X,0,1)
			sliderButton.Position = UDim2.new(percentage,0,.5,0)
			
			game.ReplicatedStorage.Audio.ChangeVolume:FireServer(percentage)
			wait(0.05)
		end
	end
end)