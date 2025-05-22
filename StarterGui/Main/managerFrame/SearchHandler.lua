-- @ScriptType: LocalScript
local container = script.Parent
local bar = container:WaitForChild("SearchBarContainer"):WaitForChild("SearchBar")
local items = container:WaitForChild("troopScroller")

local SetupSearchBar = require(game.ReplicatedStorage:WaitForChild("SearchModule"))


SetupSearchBar(bar, items)

container:WaitForChild("troopScroller").ChildAdded:Connect(function()
	SetupSearchBar(bar, items)
end)

container:WaitForChild("troopScroller").ChildRemoved:Connect(function()
	SetupSearchBar(bar, items)
end)

while task.wait() do
	local troops = game.Workspace:WaitForChild(game.Players.LocalPlayer.Name.." Troops"):GetChildren()
end