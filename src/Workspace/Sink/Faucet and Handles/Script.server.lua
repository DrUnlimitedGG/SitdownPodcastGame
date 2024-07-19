local leftcd = script.Parent.Left.ClickDetector
local rightcd = script.Parent.Right.ClickDetector
local particle = script.Parent.Faucet.Union.ParticleEmitter

local left = script.Parent.Left.PrimaryPart
local right = script.Parent.Right.PrimaryPart

local tweenservice = game:GetService("TweenService")
local tweeninfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)

particle:SetAttribute("enabled", false)

function twistleftknob()
	local startPosLeft = {CFrame = left.CFrame * CFrame.Angles(math.rad(-90), 0, 0)}
	local endPosLeft = {CFrame = left.CFrame * CFrame.Angles(0, 0, 0)}
	
	local leftTween = tweenservice:Create(left, tweeninfo, startPosLeft)
	local leftTween2 = tweenservice:Create(left, tweeninfo, endPosLeft)
	
	leftTween:Play()
	wait(2.5)
	leftTween2:Play()
end

function twistrightknob()
	local startPosRight = {CFrame = right.CFrame * CFrame.Angles(math.rad(90), 0, 0)}
	local endPosRight = {CFrame = right.CFrame * CFrame.Angles(0, 0, 0)}
	
	local rightTween = tweenservice:Create(right, tweeninfo, startPosRight)
	local rightTween2 = tweenservice:Create(right, tweeninfo, endPosRight)
	
	rightTween:Play()
	wait(2.5)
	rightTween2:Play()
end

function leftclick()
	local enabled = particle:GetAttribute("enabled")
	
	if enabled == false then
		particle:SetAttribute("enabled", true)
		
		task.spawn(twistleftknob)
		particle.Enabled = true;
		wait(3)
		particle.Enabled = false;
		wait(0.5)
		
		particle:SetAttribute("enabled", false)
	elseif enabled then
		print("DNC")
	end
	
	
end

function rightclick()
	local enabled = particle:GetAttribute("enabled")

	if enabled == false then
		particle:SetAttribute("enabled", true)

		task.spawn(twistrightknob)
		particle.Enabled = true;
		wait(3)
		particle.Enabled = false;
		wait(0.5)

		particle:SetAttribute("enabled", false)
	elseif enabled then
		print("DNC")
	end


end

leftcd.MouseClick:Connect(leftclick)
rightcd.MouseClick:Connect(rightclick)