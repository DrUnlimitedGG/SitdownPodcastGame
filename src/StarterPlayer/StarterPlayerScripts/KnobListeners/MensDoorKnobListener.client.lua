local tweenservice = game:GetService("TweenService")
local event = game.ReplicatedStorage.Knobs.MensRoom.MensDoor

event.OnClientEvent:Connect(function(door, DoorSwingInfo, properties)

	local tweeninfo = TweenInfo.new(unpack(DoorSwingInfo))
	local Tween = tweenservice:Create(door, tweeninfo, properties)
	Tween:Play()

end)