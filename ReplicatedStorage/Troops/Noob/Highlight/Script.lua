-- @ScriptType: Script
while task.wait() do
	local ratio = script.Parent.Parent:WaitForChild("Humanoid").Health/script.Parent.Parent:WaitForChild("Humanoid").MaxHealth
	local counterratio = 1-ratio
	local a = math.round(counterratio*255)
	local b = math.round(ratio*255)

	script.Parent.OutlineColor = Color3.fromRGB(a, b, 0)
end