local TweenService = game:GetService("TweenService")

local door = workspace.LobbyDoor
local doorRoot = door.PrimaryPart
local properties = {CFrame = doorRoot.CFrame * CFrame.Angles(math.rad(-90), 0, 0)}
local closeProerties = {CFrame = doorRoot.CFrame * CFrame.Angles(math.rad(0), 0, 0)}
local open = door.open

local DoorSwingInfo = {1.75, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0}
local closeInfo = {1.75, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0}

open = false

game.Workspace.LobbyDoor.ClickDetector.MouseClick:Connect(function(player)
	if open == false then
		open = true
		game.ReplicatedStorage.Doors.Door1:FireAllClients(DoorSwingInfo, properties)
		door.DoorOpen:Play()
		wait(3)
		game.ReplicatedStorage.Doors.Door1:FireAllClients(closeInfo, closeProerties)
		wait(1.1)
		door.DoorClose:Play()
		wait(0.65)
		open = false
	elseif open == true then
		print("DNC")
	end
end)