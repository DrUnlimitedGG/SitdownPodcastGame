local tweenservice = game:GetService("TweenService")
local event = game.ReplicatedStorage.Doors.Doors
local knobEvent = game.ReplicatedStorage.Doors.Knobs


function openDoor(door, hasAudio, openStyle, turnDegree, hasKnob, knob)
	local doorRoot = door.PrimaryPart
	
	knob = knob or "No knob provided"
	
	
	local properties = {CFrame = doorRoot.CFrame * CFrame.Angles(math.rad(turnDegree), 0, 0)}
	local closeProperties = {CFrame = doorRoot.CFrame * CFrame.Angles(0, 0, 0)}
	
	local open = door:GetAttribute("open")
	local DoorSwingInfo = {}
	local closeInfo = {}
	
	
	
	if openStyle == "quad" then
		DoorSwingInfo = {1.75, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0}
		closeInfo = {1.75, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0}
	elseif openStyle == "linear" then
		DoorSwingInfo = {1.75, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0}
		closeInfo = {1.75, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0}
	elseif openStyle == "back" then
		DoorSwingInfo = {1.75, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0}
		closeInfo = {1.75, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0}
	else
		DoorSwingInfo = {1.75, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0}
		closeInfo = {1.75, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0}
	end
	
	if open == false then
		open = true
		
		if hasAudio then
			event:FireAllClients(doorRoot, DoorSwingInfo, properties)
			door:FindFirstChild("ClickDetector").MaxActivationDistance = 0
			door.DoorOpen:Play()
			wait(3)
			event:FireAllClients(doorRoot, closeInfo, closeProperties)
			wait(1.1)
			door.DoorClose:Play()
			wait(0.65)
			door:FindFirstChild("ClickDetector").MaxActivationDistance = 10
		else 
			event:FireAllClients(doorRoot, DoorSwingInfo, properties)
			door:FindFirstChild("ClickDetector").MaxActivationDistance = 0
			wait(3)
			event:FireAllClients(doorRoot, closeInfo,closeProperties)
			wait(1.75)
			door:FindFirstChild("ClickDetector").MaxActivationDistance = 10
		end
	elseif open then
		print("DNC")
	end
end

local Door1 = workspace:FindFirstChild("BackstageHallwayDoor")
local Door1CD = Door1:FindFirstChild("ClickDetector")


