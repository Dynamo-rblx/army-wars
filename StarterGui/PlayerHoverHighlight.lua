-- @ScriptType: LocalScript
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
Mouse.TargetFilter = workspace:WaitForChild("MouseIgnore")

local RunService = game:GetService("RunService")

local HighlightedChar

-- Function to remove highlight from a character
local function HighlightRemove()
	if not HighlightedChar then return end
	local Highlight = HighlightedChar:FindFirstChildOfClass("Highlight")
	if Highlight then
		Highlight:Destroy()
	end
	HighlightedChar = nil
end

-- Function to apply highlight to a character
local function HighlightGive(character)
	-- Check if we are already highlighting this character
	if HighlightedChar == character then return end

	-- Remove highlight from previous character
	HighlightRemove()

	-- Highlight the new character
	HighlightedChar = character
	local Highlight = Instance.new("Highlight")
	Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)  -- White outline
	Highlight.FillColor = Color3.fromRGB(255, 255, 255)     -- White fill color
	Highlight.Adornee = character  -- Apply highlight to the whole character model
	Highlight.Parent = character
end

game.Players.LocalPlayer:GetMouse().Move:Connect(function()
	local raycastParams = RaycastParams.new()
	raycastParams.FilterDescendantsInstances = workspace:FindFirstChild(game.Players.LocalPlayer.Name.." Troops"):GetChildren()
	raycastParams.FilterType = Enum.RaycastFilterType.Include

	local raycastResult = workspace:Raycast(Mouse.UnitRay.Origin, Mouse.UnitRay.Direction * 250)

	if raycastResult then
		local raycastHit = raycastResult.Instance
		if raycastHit then
			local raycastModel = raycastHit:FindFirstAncestorOfClass("Model")
			if raycastModel then

				HighlightGive(raycastModel)
			else
				HighlightRemove()
			end
		end
	end
end)

-- RenderStepped to constantly check where the mouse is pointing
RunService.RenderStepped:Connect(function()


	--[[
	local target = Mouse.Target

	-- Ensure the mouse is over a valid target
	if target then
		print(target.Name)
		
		
		local character = target:FindFirstAncestorOfClass("Model")
		if character and character:FindFirstChildOfClass("Humanoid") then
			-- Check if this character is controlled by a player
			print(character.Name)
			if character:WaitForChild("plrToFollow").Value == game.Players.LocalPlayer.Character then
				-- Apply highlight if hovering over any part of a player character
				HighlightGive(character)
			else
				-- Not a player, remove highlight
				HighlightRemove()
			end
		else
			-- Not a valid character, remove highlight
			HighlightRemove()
		end
	else
		-- Mouse is not over a character, remove highlight
		HighlightRemove()
	end
	]]
end)
