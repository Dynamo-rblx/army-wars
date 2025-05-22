-- @ScriptType: LocalScript
local box = script.Parent.Parent:WaitForChild("troop#Frame")
local focused = false
local mobileOpen = false

box:WaitForChild("numberToSpawn").ClearTextOnFocus = false

box:WaitForChild("numberToSpawn").Focused:Connect(function()
	focused = true
end)

box:WaitForChild("numberToSpawn").FocusLost:Connect(function()
	focused = false
end)

if game.Players.LocalPlayer:WaitForChild("Device Type").Value == "Computer" then
	script.Parent.MouseEnter:Connect(function()
		box:TweenPosition(UDim2.new(0.5,0,0.5,0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.2, true)
	end)

	script.Parent.MouseLeave:Connect(function()
		if focused == false then
			box:TweenPosition(UDim2.new(0.5,0,0.63,0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.2, true)
		else
			box:WaitForChild("numberToSpawn").FocusLost:Wait()
			task.wait(0.2)
			box:TweenPosition(UDim2.new(0.5,0,0.63,0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.2, true)
		end
	end)
else
	script.Parent.Parent:WaitForChild("troopBtn").Visible = true
	box.Visible = false
	script.Parent.Parent:WaitForChild("troopBtn"):WaitForChild("TextButton").TouchTap:Connect(function()
		if mobileOpen == false then
			box:TweenPosition(UDim2.new(0.5,0,0.5,0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.2, true)
			mobileOpen = true
		else
			box:TweenPosition(UDim2.new(0.5,0,0.63,0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.2, true)
			mobileOpen = false
		end
	end)

end