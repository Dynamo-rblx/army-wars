-- @ScriptType: Script
while task.wait(0.15) do
	
	if script.Parent:WaitForChild("Attacking").Value == false then
		target = script.Parent:WaitForChild("plrToFollow").Value.PrimaryPart
	else
		if script.Parent:WaitForChild("objectToAttack").Value:WaitForChild("Humanoid").Health > 0 then
			target = script.Parent:WaitForChild("objectToAttack").Value.PrimaryPart
		else
			target = script.Parent:WaitForChild("plrToFollow").Value.PrimaryPart
		end
		
	end
	
	if target ~= nil then
		script.Parent.Humanoid:MoveTo(target.Position + Vector3.new(Random.new():NextNumber(-10, 10), Random.new():NextNumber(-10, 10), Random.new():NextNumber(-10, 10)))
	end
	PositionTorso = script.Parent:WaitForChild("Torso").Position
end