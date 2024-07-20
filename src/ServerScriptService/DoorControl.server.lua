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

local Door3 = workspace:FindFirstChild("BackstageDoor")
local Door3CD = Door3:FindFirstChild("ClickDetector")

local Door4 = workspace:FindFirstChild("TheJanitorDoor")
local Door4CD = Door4:FindFirstChild("ClickDetector")

local BathroomWoahMens = workspace:FindFirstChild("BathroomWoahMens")
local BathroomWoahMensCD = BathroomWoahMens:FindFirstChild("ClickDetector")

local BathroomMens = workspace:FindFirstChild("BathroomMens")
local BathroomMensCD = BathroomMens:FindFirstChild("ClickDetector")

local MenLeft = workspace:FindFirstChild("MenLeft")
local MenLeftCD = MenLeft:FindFirstChild("ClickDetector")

local MenMid = workspace:FindFirstChild("MenMid")
local MenMidCD = MenMid:FindFirstChild("ClickDetector")

local MenRight = workspace:FindFirstChild("MenRight")
local MenRightCD = MenRight:FindFirstChild("ClickDetector")

local BathroomDoor = workspace:FindFirstChild("BathroomDoor")
local BathroomDoorCD = BathroomDoor:FindFirstChild("ClickDetector")

local Women1 = workspace:FindFirstChild("Women1")
local Women1CD = Women1:FindFirstChild("ClickDetector")

local Women2 = workspace:FindFirstChild("Women2")
local Women2CD = Women2:FindFirstChild("ClickDetector")

local Women3 = workspace:FindFirstChild("Women3")
local Women3CD = Women3:FindFirstChild("ClickDetector")

local Women4 = workspace:FindFirstChild("Women4")
local Women4CD = Women4:FindFirstChild("ClickDetector")

local Women5 = workspace:FindFirstChild("Women5")
local Women5CD = Women5:FindFirstChild("ClickDetector")

local LobbyDoor = workspace:FindFirstChild("LobbyDoor")
local LobbyCD = LobbyDoor:FindFirstChild("ClickDetector")

local CaptainDoor = workspace:FindFirstChild("CaptainLounge")
local CaptainDoorCD = CaptainDoor:FindFirstChild("ClickDetector")

Door1CD.MouseClick:Connect(function()
	openDoor(Door1, true, "quad", 90, true, Door1.Union)
end)

Door2CD.MouseClick:Connect(function()
	openDoor(Door2, true, "quad", 90, false)
end)

Door3CD.MouseClick:Connect(function()
	openDoor(Door3, true, "quad", -80, false)
end)

Door4CD.MouseClick:Connect(function()
	openDoor(Door4, true, "quad", -90, false)
end)

BathroomWoahMensCD.MouseClick:Connect(function()
	openDoor(BathroomWoahMens, true, "quad", -90, false)
end)

BathroomMensCD.MouseClick:Connect(function()
	openDoor(BathroomMens, true, "quad", 90, false)
end)

MenLeftCD.MouseClick:Connect(function()
	openDoor(MenLeft, false, "back", -90, false)
end)

MenMidCD.MouseClick:Connect(function()
	openDoor(MenMid, false, "back", -90, false)
end)

MenRightCD.MouseClick:Connect(function()
	openDoor(MenRight, false, "back", -90, false)
end)

Women1CD.MouseClick:Connect(function()
	openDoor(Women1, false, "back", 90, false)
end)

Women2CD.MouseClick:Connect(function()
	openDoor(Women2, false, "back", 90, false)
end)

Women3CD.MouseClick:Connect(function()
	openDoor(Women3, false, "back", 90, false)
end)

Women4CD.MouseClick:Connect(function()
	openDoor(Women4, false, "back", 90, false)
end)

Women5CD.MouseClick:Connect(function()
	openDoor(Women5, false, "back", 90, false)
end)

BathroomDoorCD.MouseClick:Connect(function()
	openDoor(BathroomDoor, true, "quad", -90, false)
end)

LobbyCD.MouseClick:Connect(function()
	openDoor(LobbyDoor, true, "quad", -90, false)
end)

CaptainDoorCD.MouseClick:Connect(function()
	openDoor(CaptainDoor, true, "quad", -90, false)
end)
