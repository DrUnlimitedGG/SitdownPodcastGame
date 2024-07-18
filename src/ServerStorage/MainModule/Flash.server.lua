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

local i = 1
local lights = {"S", "I", "T", "BottomT", "H", "D", "E", "O", "W", "N"}


allOff()
wait(1)
	
while i < 11 do
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

wait(2)
script:Destroy()
	



