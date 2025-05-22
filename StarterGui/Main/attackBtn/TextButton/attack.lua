-- @ScriptType: LocalScript
function FindTarget()
	local maxDistance = 1000
	local target = nil
	for i,v in pairs(workspace:GetChildren()) do
		if v:FindFirstChild("Attackable") then
			if (v.Head.Position-game.Players.LocalPlayer.Character.Head.Position).magnitude < maxDistance and  v:FindFirstChild("Attackable").Value == true then
				target = v
			end
		end
	end
	return target
end

script.Parent.MouseButton1Click:Connect(function()

	local target = FindTarget()
	if target then
		game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("attack"):FireServer(target)
	end
end)