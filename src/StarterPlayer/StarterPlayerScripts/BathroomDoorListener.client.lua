local RS = game:GetService("ReplicatedStorage")
local event = RS.Doors:WaitForChild("BathroomDoor")
local door = workspace.BathroomDoor
local doorRoot = door.PrimaryPart
local TweenService = game:GetService("TweenService")



event.OnClientEvent:Connect(function(DoorSwingInfo, properties)
	local tweeninfo = TweenInfo.new(unpack(DoorSwingInfo))
	local DoorSwingTween = TweenService:Create(doorRoot,tweeninfo,properties)
	DoorSwingTween:Play()
end)