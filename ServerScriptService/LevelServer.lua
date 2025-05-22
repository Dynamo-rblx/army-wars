-- @ScriptType: Script
local dss = game:GetService("DataStoreService")
local levelDS = dss:GetDataStore("LevelsDS")


function incrementExp(player, increment)
	
	for i = player.leaderstats.XP.Value, player.leaderstats.XP.Value + increment do
		
		player.leaderstats.XP.Value = i
		
		wait()
	end
end


function saveData(player)
	
	pcall(function()
		
		local level = player.leaderstats.Level.Value
		local exp = player.leaderstats.XP.Value
		
		levelDS:SetAsync(player.UserId .. "Level", {level, exp})
	end)
end


game.Players.PlayerAdded:Connect(function(player)
	
	
	local statsFolder = player:WaitForChild("leaderstats")
	
	local levelVal = Instance.new("IntValue", statsFolder)
	levelVal.Name = "Level"
	levelVal.Value = 1
	
	local expVal = Instance.new("IntValue", statsFolder)
	expVal.Name = "XP"
	
	
	pcall(function()
		
		local data = levelDS:GetAsync(player.UserId .. "Level")
		
		if data then
			
			levelVal.Value = data[1]
			expVal.Value = data[2]
		end
	end)
	
	
	expVal:GetPropertyChangedSignal("Value"):Connect(function()
		
		local neededExp = math.floor(levelVal.Value ^ 1.5 + 0.5) * 500
		
		if expVal.Value >= neededExp then
			
			levelVal.Value += 1
		end
	end)
	
	
	while task.wait(5) do
		
		incrementExp(player, 3)
	end
end)


game.Players.PlayerRemoving:Connect(saveData)

game:BindToClose(function()
	
	for i, player in pairs(game.Players:GetPlayers()) do
		
		saveData(player)
	end
end)