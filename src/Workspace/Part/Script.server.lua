script.Parent.Touched:Connect(function(touch)
	if game.Players:GetPlayerFromCharacter(touch.Parent) then
		warn("Easter Egg activated!")
		touch.Parent.HumanoidRootPart.CFrame = CFrame.new(-182.75, 80.55, -36.25)
		
		wait(1)
	end
end)