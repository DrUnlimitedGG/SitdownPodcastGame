local opened = script.Parent.Parent.Parent.Light.Open.Value
script.Parent.Parent.Parent.Light.AnchorPoint = Vector2.new(0.5, 0.5)
local already = script.Parent.Parent.Parent.Light.Position

script.Parent.MouseButton1Click:Connect(function()
	if opened == false then
		script.Parent.Parent.Parent.Light.Visible = true
		script.Parent.Parent.Parent.Light:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5)
		wait(0.5)
		opened = true	
	elseif opened == true then
		script.Parent.Parent.Parent.Light:TweenPosition(UDim2.new(0.5, 0, 1, script.Parent.Parent.Parent.Light.Size.Y.Offset/2), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5)
		wait(0.5)
		script.Parent.Parent.Parent.Light.Visible = false
		opened = false	
	end
end)
	