wait(2)

function off()
	for i, v in pairs(script.Parent:GetChildren()) do
		if v:IsA("BasePart") then
			v.BrickColor = BrickColor.new("Really black")
		end
	end
end

function on()
	for i, v in pairs(script.Parent:GetChildren()) do
		if v:IsA("BasePart") then
			v.BrickColor = BrickColor.new("Really red")
		end
	end
end

while true do
	wait(math.random(120,300))
	off()
	wait(0.4)
	on()
	wait(0.2)
	off()
	wait(0.1)
	on()

	break

end