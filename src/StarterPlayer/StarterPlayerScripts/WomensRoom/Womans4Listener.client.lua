local RS = game:GetService("ReplicatedStorage")
local event = RS.Doors.WomensRoom:WaitForChild("Womans4")
local door = workspace.Women4
local doorRoot = door.PrimaryPart
local TweenService = game:GetService("TweenService")



event.OnClientEvent:Connect(function(DoorSwingInfo, properties)
	local tweeninfo = TweenInfo.new(unpack(DoorSwingInfo))
	local DoorSwingTween = TweenService:Create(doorRoot,tweeninfo,properties)
	DoorSwingTween:Play()
end)