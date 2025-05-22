-- @ScriptType: LocalScript
script.Parent.MouseButton1Click:Connect(function()
	game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("retreatTroops"):FireServer()
end)