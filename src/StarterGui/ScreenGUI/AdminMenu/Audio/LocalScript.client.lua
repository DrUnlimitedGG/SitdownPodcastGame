local opened = script.Parent.Parent.Parent.Audio.Open.Value
script.Parent.Parent.Parent.Audio.AnchorPoint = Vector2.new(0.5, 0.5)
local already = script.Parent.Parent.Parent.Audio.Position

script.Parent.MouseButton1Click:Connect(function()
	if opened == false then
		script.Parent.Parent.Parent.Audio.Visible = true
		script.Parent.Parent.Parent.Audio:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5)
		wait(0.5)
		opened = true	
	elseif opened == true then
		script.Parent.Parent.Parent.Audio:TweenPosition(UDim2.new(0.5, 0, 1, script.Parent.Parent.Parent.Audio.Size.Y.Offset/2), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5)
		wait(0.5)
		script.Parent.Parent.Parent.Audio.Visible = false
		opened = false	
	end
end)
	