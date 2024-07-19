-- Define variable
local toilet, handle = script.Parent, script.Parent.Handle.PrimaryPart
local click = script.Parent.Handle:WaitForChild("ClickDetector")
local water = toilet:WaitForChild("StaticWater")
local waterMesh = water:WaitForChild("Mesh")

local oldWaterPos = water.Position

-- Define services
local tweenservice = game:GetService("TweenService")

-- handle tween information
local handleInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
local handleStartPos = {CFrame = handle.CFrame * CFrame.Angles(math.rad(30), 0, 0)}
local handleEndPos = {CFrame = handle.CFrame * CFrame.Angles(0, 0, 0)}

-- scale water down information
local scaleDownInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
local scaleDownPos = {Scale = Vector3.new(1, 0, 0.75)}

-- move down information
local moveDownInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
local moveDownPos = {Position = water.Position + Vector3.new(0, -0.444, 0)}

-- scale water up information
local scaleUpInfo = TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
local scaleUpPos = {Scale = Vector3.new(1, 0, 1)}

-- move up information
local moveUpInfo = TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
--local moveUpPos = {Position = water.Position + Vector3.new(0, 0.0069375, 0)}
local moveUpPos = {Position = oldWaterPos}

function moveHandle()		
	local tween1 = tweenservice:Create(handle, handleInfo, handleStartPos)
	local tween2 = tweenservice:Create(handle, handleInfo, handleEndPos)

	tween1:Play()
	tween1.Completed:Connect(function() wait(1) tween2:Play() end)
	tween2.Completed:Connect(function()  end)
	print("DNC")
		
end

function scaleWaterDown()	
	local scaleDown = tweenservice:Create(waterMesh, scaleDownInfo, scaleDownPos)
	
	scaleDown:Play()
end

function moveWaterDown()
	local moveDown = tweenservice:Create(water, moveDownInfo, moveDownPos)
	moveDown:Play()
end

function scaleWaterUp()
	local scaleUp = tweenservice:Create(waterMesh, scaleUpInfo, scaleUpPos)
	scaleUp:Play()
end

function moveWaterUp()
	water.Color = Color3.fromRGB(199, 212, 228)
	
	local moveUp = tweenservice:Create(water, moveUpInfo, moveUpPos)
	moveUp:Play()
	
end

click.MouseClick:Connect(function()
	local flushed = script.Parent.Handle:GetAttribute("flushed")
	
	if flushed == false then
		script.Parent.Handle:SetAttribute("flushed", true)

		task.spawn(moveHandle)
		task.spawn(scaleWaterDown)
		task.spawn(moveWaterDown)
		
		wait(1.75)
		
		task.spawn(moveWaterUp)
		task.spawn(scaleWaterUp)
		
		wait(6)
		
		script.Parent.Handle:SetAttribute("flushed", false)
	elseif flushed then
		print("DNC")

	end
end)

script.Parent:WaitForChild("Seat").ChildAdded:Connect(function(part)
	if part.Name == "SeatWeld" then
		water.BrickColor = BrickColor.new("Cool yellow")
	end
end)