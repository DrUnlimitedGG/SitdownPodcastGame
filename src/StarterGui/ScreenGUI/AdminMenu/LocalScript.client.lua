script.Parent.AnchorPoint = Vector2.new(0.5, 0)
script.Parent.Position = UDim2.new(0, script.Parent.Size.X.Offset/2, 1, -script.Parent.Size.Y.Offset)
script.Parent.Parent.Enabled = false

game.ReplicatedStorage.ShowGUI.OnClientEvent:Connect(function(player)
	script.Parent.Parent.Enabled = true
end)




