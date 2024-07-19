local tweenservice = game:GetService("TweenService")
local part = script.Parent
local cd = script.Parent:WaitForChild("ClickDetector")

local tweeninfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
local properties = {CFrame = part.CFrame * CFrame.Angles(0, 0, math.rad(15))}
local endProperties = {CFrame = part.CFrame * CFrame.Angles(0, 0, 0)}

cd.MouseClick:Connect(function()
	local moving = script.Parent:GetAttribute("moving")
	
	if moving then
		print("DNC")
	elseif moving == false then
		script.Parent:SetAttribute("moving", true)
		
		local tween = tweenservice:Create(part, tweeninfo, properties)
		local tween2 = tweenservice:Create(part, tweeninfo, endProperties)
		
		tween:Play()
		wait(1.5)
		tween2:Play()
		
		tween2.Completed:Connect(function() script.Parent:SetAttribute("moving", false) end)
	end
end)

