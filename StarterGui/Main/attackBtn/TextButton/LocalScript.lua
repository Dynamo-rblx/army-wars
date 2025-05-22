-- @ScriptType: LocalScript
local display = script.Parent.Parent:WaitForChild("btnNameDisplay")

if game.Players.LocalPlayer:WaitForChild("Device Type").Value == "Computer" then
script.Parent.MouseEnter:Connect(function()
		display:TweenSizeAndPosition(UDim2.new(1.523,0,0.488,0), UDim2.new(0,0,1.2,0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.1, true)
end)

script.Parent.MouseLeave:Connect(function()
		display:TweenSizeAndPosition(UDim2.new(0.076,0,0.488,0), UDim2.new(0.579,0,0.212,0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
end)
else
	display.Position = UDim2.new(0,0,1.2,0)
	display.Size = UDim2.new(1.523,0,0.488,0)
end