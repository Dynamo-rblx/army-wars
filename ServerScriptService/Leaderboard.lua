-- @ScriptType: Script
local DS = game:GetService("DataStoreService")
local cashStore = DS:GetDataStore("Cash")
--local levelStore = DS:GetDataStore("Level")
--local xpStore = DS:GetDataStore("XP")
local armyStore = DS:GetDataStore("ArmySize")
local troopStore = DS:GetDataStore("TroopsDS")

game.Players.PlayerAdded:Connect(function(plr)
	local troopFolder = Instance.new("Folder")
	troopFolder.Parent = workspace
	troopFolder.Name = plr.Name.." Troops"
	
	local dT = Instance.new("StringValue")
	dT.Name = "Device Type"
	dT.Value = "Computer"
	dT.Parent = plr
	
	local sS = Instance.new("IntValue")
	sS.Name = "Spawn Size"
	sS.Value = 1
	sS.Parent = plr
	
	local lb = Instance.new("Folder")
	lb.Name = "leaderstats"
	lb.Parent = plr
	
	local cash = Instance.new("IntValue")
	cash.Name = "Cash"
	cash.Parent = lb
	cash.Value = 0 or cashStore:GetAsync(plr.UserId)
	
	--local level = Instance.new("IntValue")
	--level.Name = "Level"
	--level.Parent = lb
	--level.Value = 1 or level:GetAsync(plr.UserId)
	
	--local xp = Instance.new("IntValue")
	--xp.Name = "XP"
	--xp.Parent = lb
	--xp.Value = 0 or xp:GetAsync(plr.UserId)
	
	local armySize = Instance.new("IntValue")
	armySize.Name = "Army Size"
	armySize.Parent = lb
	armySize.Value = 0 or armySize:GetAsync(plr.UserId)
	
	if troopStore:GetAsync(plr.UserId) then
		for i, v in pairs(troopStore:GetAsync(plr.UserId)) do	
			local newTroop = game:GetService("ReplicatedStorage"):WaitForChild("Troops"):WaitForChild(v[1]):Clone()
			newTroop.Birthday.Value = v[2] or "1/1/2001"
			newTroop.Damage.Value = v[3] or 0
			newTroop.Healing.Value = v[4] or 0
			newTroop:WaitForChild("plrToFollow").Value = plr.Character or plr.CharacterAdded:Wait()
			newTroop.PrimaryPart.Position = plr.Character.PrimaryPart.CFrame.Position + Vector3.new(Random.new():NextInteger(-15,15),Random.new():NextInteger(-15,15),Random.new():NextInteger(-15,15))
			newTroop.Name = i
			newTroop.Parent = game.Workspace:WaitForChild(plr.Name.." Troops")

			armySize.Value += 1
		end
	end
	
	while task.wait() do
		armySize.Value = #troopFolder:GetChildren()
	end
end)

game.Players.PlayerRemoving:Connect(function(plr)
	cashStore:SetAsync(plr.UserId, plr.leaderstats.Cash.Value)
	--levelStore:SetAsync(plr.UserId, plr.leaderstats.Level.Value)
	--xpStore:SetAsync(plr.UserId, plr.leaderstats.XP.Value)
	armyStore:SetAsync(plr.UserId, plr.leaderstats["Army Size"].Value)
	
	local tableOfTroops = {}
	
	if #workspace:WaitForChild(plr.Name.." Troops"):GetChildren() == 0 then print("Nothing") end
	for i, v in pairs(workspace:WaitForChild(plr.Name.." Troops"):GetChildren()) do
		print(v.Name)
		print(v:WaitForChild("Type").Value)
		tableOfTroops[v.Name] = {v:WaitForChild("Type").Value, v:WaitForChild("Birthday").Value, v:WaitForChild("Damage").Value, v:WaitForChild("Healing").Value}
	end
	
	print(tableOfTroops)
	troopStore:SetAsync(plr.UserId, tableOfTroops)
end)