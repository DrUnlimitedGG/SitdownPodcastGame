function flashOn(light)
	script.Parent:FindFirstChild(light).BrickColor = BrickColor.new("Really red")
end

function allOff()
	for i, v in pairs(script.Parent:GetChildren()) do
		if v:IsA("BasePart") then
			v.BrickColor = BrickColor.new("Really black")
		end
	end
end

function allOn()
	for i, v in pairs(script.Parent:GetChildren()) do
		if v:IsA("BasePart") then
			v.BrickColor = BrickColor.new("Really red")
		end
	end
end

function flashSign()
	local i = 1
	local lights = {"S", "I", "T", "BottomT", "H", "D", "E", "O", "W", "N", "Arrow"}
	-- change order of lights to flash here

	allOff()
	wait(1)

	while i < 12 do
		flashOn(lights[i])
		wait(0.4)
		i = i + 1
	end
	wait(1)
	local ii = 0
	while ii < 3 do
		allOff()
		wait(0.5)
		allOn()
		wait(0.5)

		ii = ii + 1
	end

	i = 1
	ii = 0
end

while true do
	if workspace:GetAttribute("signflashing") == true then
		flashSign()
		
		workspace:SetAttribute("signflashing", false)
	end
	
	wait()
end


