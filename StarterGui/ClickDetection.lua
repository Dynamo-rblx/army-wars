-- @ScriptType: LocalScript
local camera = workspace.CurrentCamera
local mouse = game.Players.LocalPlayer:GetMouse()

local params = RaycastParams.new()
params.FilterDescendantsInstances = {} -- anything you want, for example the player's character, the ray filters through these
params.FilterType = Enum.RaycastFilterType.Exclude -- choose exclude or include
local function rayResult(x, y)
	local unitRay = camera:ScreenPointToRay(x, y) -- :ViewportPointToRay() is another choice
	return workspace:Raycast(unitRay.Origin, unitRay.Direction * 100, params) -- 500 is how far to raycast
end

-- rayResult will be a RaycastResult, link to API page below

local mousePos = game:GetService("UserInputService"):GetMouseLocation()
rayResult(mousePos.X, mousePos.Y)

local uis = game:GetService("UserInputService")
uis.InputEnded:Connect(function(input, gameProcessed) -- not exactly a click, but like the end of a mouse press or tap
	if not gameProcessed then
		local inputType = input.UserInputType
		if inputType == Enum.UserInputType.Touch or inputType == Enum.UserInputType.MouseButton1 then
			local target = rayResult(input.Position.X, input.Position.Y)
			
			if target then
				if target.Instance:FindFirstAncestorOfClass("Model") then
					local model = target.Instance:FindFirstAncestorOfClass("Model")
					print(model.Name)
					
					if model.Name ~= game.Players.LocalPlayer.Name then
						if model:FindFirstChild("Attackable") then
							if model.Attackable.Value == true then
								game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("attack"):FireServer(model)
							end
						end
					else
						game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("retreatTroops"):FireServer()
					end
				else
					print(target.Instance.Name)
				end
				
			end
		end
	end
end)