local tweenservice = game:GetService("TweenService")
local cd = script.Parent.ClickDetector

local TweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear)

local goal1 = {CFrame = script.Parent.CFrame * CFrame.Angles(0,0,math.rad(120))}
local goal2 = {CFrame = script.Parent.CFrame * CFrame.Angles(0,0,math.rad(-60))}
local goal3 = {CFrame = script.Parent.CFrame * CFrame.Angles(0,0,math.rad(0))}

local tween1 = tweenservice:Create(script.Parent, TweenInfo, goal1)
local tween2 = tweenservice:Create(script.Parent, TweenInfo, goal2)
local tween3 = tweenservice:Create(script.Parent, TweenInfo, goal3)

cd.MouseClick:Connect(function()
	cd.MaxActivationDistance = 0
	workspace:FindFirstChild("SecretPainting").SecretPainting.CanCollide = false
	warn(workspace:FindFirstChild("SecretPainting").SecretPainting.CanCollide)
	tween1:Play()
	tween1.Completed:Connect(function() tween2:Play() end)
	tween2.Completed:Connect(function() tween3:Play() end)
	wait(8.5)
	workspace:FindFirstChild("SecretPainting").SecretPainting.CanCollide = true
	warn(workspace:FindFirstChild("SecretPainting").SecretPainting.CanCollide)
	cd.MaxActivationDistance = 6
end)


