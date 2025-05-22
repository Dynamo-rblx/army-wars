-- @ScriptType: LocalScript
local debounce = false

script.Parent.MouseButton1Click:Connect(function()
	if debounce then
		script.Parent.Parent.Parent:WaitForChild("managerFrame"):TweenPosition(UDim2.new(-0.3, 0,0.25, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.21, true)
		script.Parent.Parent.Parent:WaitForChild("managerFrame"):WaitForChild("coverAll").Interactable = false
		script.Parent.Parent.Parent:WaitForChild("managerFrame"):WaitForChild("coverAll").Visible = false
		script.Parent.Parent.Parent:WaitForChild("managerFrame"):WaitForChild("coverAll").Active = false
	else
		script.Parent.Parent.Parent:WaitForChild("managerFrame"):TweenPosition(UDim2.new(0.124, 0,0.25, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.21, true)
		script.Parent.Parent.Parent:WaitForChild("managerFrame"):WaitForChild("coverAll").Interactable = true
		script.Parent.Parent.Parent:WaitForChild("managerFrame"):WaitForChild("coverAll").Visible = true
		script.Parent.Parent.Parent:WaitForChild("managerFrame"):WaitForChild("coverAll").Active = true
	end
	debounce = not(debounce)
end)