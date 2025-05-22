-- @ScriptType: LocalScript
local debounce = true

script.Parent.MouseButton1Click:Connect(function()
	if debounce then
		game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("pauseTroops"):FireServer(true)
	else
		game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("pauseTroops"):FireServer(false)
	end
	debounce = not(debounce)
end)