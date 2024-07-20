local TweenService = game:GetService("TweenService")

local CheckGroupRank = require(game.ServerScriptService.CheckGroupRank)

local door = workspace:FindFirstChild("BackstageHallwayDoor")
local doorRoot = door.PrimaryPart
local properties = {CFrame = doorRoot.CFrame * CFrame.Angles(math.rad(-90), 0, 0)}
local closeProerties = {CFrame = doorRoot.CFrame * CFrame.Angles(math.rad(0), 0, 0)}

local DoorSwingInfo = {1.75, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0}
local closeInfo = {1.75, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0}

open = false

game.Workspace:WaitForChild("BackstageHallwayDoor").ClickDetector.MouseClick:Connect(function(player)
	if player:GetRankInGroup(4890641) >= 0 then
		if door:GetAttribute("open") == false then
			door:SetAttribute("open", true)
			game.ReplicatedStorage.Doors.Door1:FireClient(player, DoorSwingInfo, properties)
			warn("fired opening")

			door.DoorOpen:Play()
			wait(3)
			game.ReplicatedStorage.Doors.Door1:FireClient(player, closeInfo, closeProerties)
			warn("fired closing")
			wait(1.1)
			door.DoorClose:Play()
			wait(0.65)
			door:SetAttribute("open", false)
		elseif door:GetAttribute("open") == true then
			print("DNC")
		end
	end
end)