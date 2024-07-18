local opened = script.Parent.Parent.Parent.General.Open.Value
script.Parent.Parent.Parent.General.AnchorPoint = Vector2.new(0.5, 0.5)
local already = script.Parent.Parent.Parent.General.Position

script.Parent.MouseButton1Click:Connect(function()
	if opened == false then
		script.Parent.Parent.Parent.General.Visible = true
		script.Parent.Parent.Parent.General:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5)
		wait(0.5)
		opened = true	
	elseif opened == true then
		script.Parent.Parent.Parent.General:TweenPosition(UDim2.new(0.5, 0, 1, script.Parent.Parent.Parent.General.Size.Y.Offset/2), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5)
		wait(0.5)
		script.Parent.Parent.Parent.General.Visible = false
		opened = false	
	end
end)
	