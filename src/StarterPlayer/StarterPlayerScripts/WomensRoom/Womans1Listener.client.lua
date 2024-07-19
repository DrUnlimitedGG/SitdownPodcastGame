local RS = game:GetService("ReplicatedStorage")
local event = RS.Doors.WomensRoom:WaitForChild("Womans1")
local door = workspace.Women1
local doorRoot = door.PrimaryPart
local TweenService = game:GetService("TweenService")



event.OnClientEvent:Connect(function(DoorSwingInfo, properties)
	local tweeninfo = TweenInfo.new(unpack(DoorSwingInfo))
	local DoorSwingTween = TweenService:Create(doorRoot,tweeninfo,properties)
	DoorSwingTween:Play()
end)