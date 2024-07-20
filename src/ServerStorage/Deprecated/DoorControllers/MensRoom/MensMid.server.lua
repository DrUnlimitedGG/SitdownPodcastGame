local TweenService = game:GetService("TweenService")

local door = workspace.MenMid
local doorRoot = door.PrimaryPart
local properties = {CFrame = doorRoot.CFrame * CFrame.Angles(math.rad(90), 0, 0)}
local closeProerties = {CFrame = doorRoot.CFrame * CFrame.Angles(math.rad(0), 0, 0)}
local open = door:GetAttribute("open")

local DoorSwingInfo = {1.75, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0}
local closeInfo = {1.75, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0}

open = false

game.Workspace.MenMid.ClickDetector.MouseClick:Connect(function(player)
	if open == false then
		open = true
		game.ReplicatedStorage.Doors.MensRoom.MensMid:FireAllClients(DoorSwingInfo, properties)
		wait(3)
		game.ReplicatedStorage.Doors.MensRoom.MensMid:FireAllClients(closeInfo, closeProerties)
		wait(1.75)
		open = false
	elseif open == true then
		print("DNC")
	end
end)