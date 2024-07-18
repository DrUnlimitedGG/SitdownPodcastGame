local player = game:GetService("Players").LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")

local animR15 = script.Parent:WaitForChild("R15Anim")
local uis = game:GetService("UserInputService")

local isFinished = true

local Handle = script.Parent

function normalPos()
	Handle.GripPos = Vector3.new(0.2,0,0)
end

function playR6()
	isFinished = false
	Handle.GripForward = Vector3.new(0,-.759,-.651)
	Handle.GripPos = Vector3.new(1.5,-.5,0.3)
	Handle.GripRight = Vector3.new(1,0,0)
	Handle.GripUp = Vector3.new(0,.651,-.759)

	wait(3)

	Handle.GripForward = Vector3.new(-.976,0,-0.217)
	Handle.GripPos = Vector3.new(0.2,0,0)
	Handle.GripRight = Vector3.new(.217,0,-.976)
	Handle.GripUp = Vector3.new(0,1,0)
	isFinished = true
end

function playR15()
	isFinished = false
	local trackR15 = animator:LoadAnimation(animR15)
	trackR15:Play()
	trackR15.Stopped:Wait()
	isFinished = true
end


local function playAnim()
	
end


