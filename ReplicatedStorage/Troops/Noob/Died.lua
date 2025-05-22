-- @ScriptType: Script
repeat task.wait() until game.Players:FindFirstChild(script.Parent:WaitForChild("plrToFollow").Value.Name)

script.Parent:WaitForChild("plrToFollow").Value:WaitForChild("Humanoid").Died:Connect(function()
	if script.Parent.Name ~= "Noob" then
		game:GetService("Debris"):AddItem(script.Parent, 1)
	end
end)

script.Parent:WaitForChild("Humanoid").Died:Connect(function()
	game:GetService("Debris"):AddItem(script.Parent, 1)
end)