local tweenservice = game:GetService("TweenService")
local event = game.ReplicatedStorage.Doors.Doors
local knobEvent = game.ReplicatedStorage.Doors.Knobs

function twistKnob(knob)
	local twistInfo = {0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0}
	local properties = {CFrame = knob.CFrame * CFrame.Angles(math.rad(60), 0, 0)}
	local endProperties = {CFrame = knob.CFrame * CFrame.Angles(0,0,0)}
	
	
	knobEvent:FireAllClients(knob, twistInfo, properties)
	wait(4.25)
	knobEvent:FireAllClients(knob, twistInfo, endProperties)
	
end

function openDoor(door, hasAudio, openStyle, turnDegree, hasKnob, knob)
	local doorRoot = door.PrimaryPart
	
	knob = knob or "No knob provided"
	
	
	local properties = {CFrame = doorRoot.CFrame * CFrame.Angles(math.rad(turnDegree), 0, 0)}
	local closeProperties = {CFrame = doorRoot.CFrame * CFrame.Angles(0, 0, 0)}
	
	local open = door:GetAttribute("open")
	local DoorSwingInfo = {}
	local closeInfo = {}
	
	if hasKnob then
		task.spawn(twistKnob,knob)
	end
	
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

local Door2 = workspace:FindFirstChild("StageDoor")
local Door2CD = Door2:FindFirstChild("ClickDetector")

Door1CD.MouseClick:Connect(function()
	openDoor(Door1, true, "quad", 90, true, Door1.Union)
end)

Door2CD.MouseClick:Connect(function()
	openDoor(Door2, true, "quad", 90, false)
end)

