local tweenservice = game:GetService("TweenService")
local model = script.Parent.PrimaryPart

local tweeninfo = TweenInfo.new(10, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
local properties = {Position = model.Position + Vector3.new(0, 10, 0)}

tween = tweenservice:Create(model, tweeninfo, properties)
wait(4)
tween:Play()