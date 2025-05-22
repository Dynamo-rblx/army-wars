-- @ScriptType: Script
local names = {
	"Alice", "Bob", "Charlie", "David", "Ella", "Fiona", "George", "Hannah", "Ian", "Jack",
	"Kara", "Liam", "Mia", "Noah", "Olivia", "Paul", "Quinn", "Rose", "Sam", "Tina",
	"Uma", "Victor", "Wendy", "Xander", "Yara", "Zack", "Amelia", "Ben", "Chloe", "Daniel",
	"Eva", "Felix", "Grace", "Harry", "Isla", "James", "Katie", "Leo", "Molly", "Nathan",
	"Oscar", "Penny", "Quincy", "Rachel", "Scott", "Tara", "Ursula", "Vince", "Willow", "Xenia",
	"Yvonne", "Zane", "Abby", "Brian", "Caitlyn", "Derek", "Emily", "Freddie", "Gemma", "Hugo",
	"Ivy", "Jordan", "Kelsey", "Lucas", "Megan", "Nora", "Owen", "Paula", "Quinton", "Rebecca",
	"Sean", "Tanya", "Ulrich", "Vanessa", "Wes", "Ximena", "Yusuf", "Zara", "Aiden", "Brianna",
	"Caleb", "Daisy", "Ethan", "Faith", "Gavin", "Hailey", "Isaac", "Jenna", "Kyle", "Lila",
	"Madison", "Nico", "Olive", "Peter", "Quinn", "Riley", "Sophia", "Tom", "Ulysses", "Violet",
	"Wyatt", "Xavier", "Yasmin", "Zoey", "Aaron", "Bella", "Cameron", "Delilah", "Eli", "Faye",
	"Gabriel", "Hazel", "Iris", "Jonah", "Kim", "Logan", "Mackenzie", "Nina", "Oliver", "Phoebe",
	"Quinn", "Ronan", "Stella", "Tristan", "Uma", "Victor", "Will", "Xander", "Yana", "Zoe",
	"Austin", "Beatrice", "Connor", "Diana", "Eleanor", "Finn", "Georgia", "Harper", "Isabel", "Julian",
	"Kaitlyn", "Levi", "Morgan", "Noelle", "Omar", "Pen elope", "Quinn", "Ryan", "Sadie", "Tyler",
	"Uri", "Vivian", "Wade", "Xena", "Yvette", "Zion", "Adam", "Bridget", "Colin", "Daphne",
	"Elsie", "Freya", "Grant", "Hope", "Isadora", "Jeremy", "Keira", "Landon", "Miles", "Natalie",
	"Orla", "Parker", "Quincy", "Reagan", "Spencer", "Tess", "Uriah", "Veronica", "Winston", "Xia",
	"Yolanda", "Zackary", "Andrea", "Blake", "Cassie", "Dominic", "Evan", "Fiona", "Giselle", "Hunter", "Isiah", "Jamie",
	"Kendall", "Lara", "Mason", "Nadine", "Olga", "Paige", "Quinlan", "Rory", "Samantha", "Tobias",
	"Umar", "Victoria", "Wayne", "Ximena", "Yara", "Zeke", "Annie", "Bruno", "Cindy", "Darren",
	"Eliot", "Frances", "Giovanni", "Haley", "Ingrid", "Jaxon", "Kara", "Liam", "Maddie", "Nate",
	"Opal", "Porter", "Quinn", "Riley", "Sofia", "Timothy", "Ulyssa", "Vera", "Wesley", "Xochitl",
	"Yasmin", "Zelda", "Avery", "Brooke", "Camden", "Dexter", "Elise", "Fletcher", "Grace", "Holly",
	"Imogen", "Jasper", "Kira", "Lyla", "Micah", "Nolan", "Oakley", "Piper", "Quinton", "Reese",
	"Skylar", "Trinity", "Uriah", "Valerie", "Wyatt", "Xavi", "Yolanda", "Zion", "Amber", "Bryce",
	"Carmen", "Dalia", "Emerson", "Felicia", "Gideon", "Haven", "Isaiah", "Jocelyn", "Kaden", "Leah",
	"Zara", "Axel", "Bria", "Calvin", "Dante", "Elsa", "Farrah", "Grayson", "Hazel", "Ivan", "Jade", "Kai",
	"Lily", "Max", "Nina", "Omar", "Peyton", "Rory", "Sierra", "Theo", "Ulrich", "Vivienne", "Wylder", "Xenia",
	"Yosef", "Zoelle", "Adele", "Barrett", "Corinne", "Declan", "Eliza", "Frank", "Georgia", "Henry", "Isabelle", "Jared",
	"Kayla", "Leighton", "Milo", "Nadia", "Ophelia", "Preston", "Rowan", "Serena", "Travis", "Uma", "Vincent", "Willa",
	"Xerxes", "Yuki", "Zayden", "Aaliyah", "Blair", "Carter", "Delaney", "Ezekiel", "Freddie", "Giselle", "Harrison", "Ila",
	"Jamie", "Kieran", "Laurel", "Mabel", "Nash", "Olive", "Phoebe", "Renee", "Stellan", "Tatum", "Ulani", "Vera", "Weston", "Xavier",
	"Yadira", "Zuri"
}


game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("deviceType").OnServerEvent:Connect(function(plr, deviceType)
	plr:WaitForChild("Device Type").Value = deviceType
	print(plr.Name.." - "..deviceType)
end)

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("spawnTroop").OnServerEvent:Connect(function(plr, numberTroops, troopName)
	if #workspace:WaitForChild(plr.Name.." Troops"):GetChildren() + numberTroops <= math.round((plr.leaderstats:WaitForChild("Level").Value^0.5)*10) then
		for i=1, plr:WaitForChild("Spawn Size").Value, 1 do
			if troopName == "" or troopName == nil or troopName == "Noob" then
				local newTroop = game:GetService("ReplicatedStorage"):WaitForChild("Troops"):WaitForChild("Noob"):Clone()
				newTroop:WaitForChild("plrToFollow").Value = plr.Character
				newTroop.PrimaryPart.Position = plr.Character.PrimaryPart.CFrame.Position + Vector3.new(Random.new():NextInteger(-15,15),Random.new():NextInteger(-15,15),Random.new():NextInteger(-15,15))
				newTroop.Name = names[Random.new():NextInteger(1, #names)].." (Noob) - "..plr:WaitForChild("leaderstats"):WaitForChild("Army Size").Value
				newTroop.Parent = game.Workspace:WaitForChild(plr.Name.." Troops")
				
				newTroop.Birthday.Value = os.date("%x")
				newTroop.Damage.Value = 0
				newTroop.Healing.Value = 0
				
			elseif troopName == "Swordsman" then

			end
			plr:WaitForChild("leaderstats"):WaitForChild("Army Size").Value += 1
			
			
		end
	else
		game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild('error'):FireClient(plr, "Error: Not enough space for troops")
		print("No space (limit:"..math.round((plr.leaderstats:WaitForChild("Level").Value^0.5)*10)..")")
		print(#workspace:WaitForChild(plr.Name.." Troops"):GetChildren())
	end
end)

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("updateSpawnNumber").OnServerEvent:Connect(function(plr, newSpawnSize)
	if plr:WaitForChild("leaderstats"):WaitForChild("Army Size").Value + newSpawnSize <= math.round((plr.leaderstats:WaitForChild("Level").Value^0.5)*10) then
		plr:WaitForChild("Spawn Size").Value = newSpawnSize
	else
		plr:WaitForChild("Spawn Size").Value = 1
	end
end)

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("pauseTroops").OnServerEvent:Connect(function(plr, pause)
	if pause then
		for i, v in pairs(workspace:WaitForChild(plr.Name.." Troops"):GetChildren()) do
			v:WaitForChild("Humanoid").WalkSpeed = 0
			print("paused")
		end
	else
		for i, v in pairs(workspace:WaitForChild(plr.Name.." Troops"):GetChildren()) do
			v:WaitForChild("Humanoid").WalkSpeed = v:WaitForChild("DefaultSpeed").Value
		end
	end
end)

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("destroyItem").OnServerEvent:Connect(function(plr, focus, item)
	plr.leaderstats.Cash.Value += math.round(item:WaitForChild("Cost").Value/5)
	focus.Value = game:GetService("ReplicatedStorage"):WaitForChild("Troops"):WaitForChild("Nobody")
	item:Destroy()
end)

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("retreatTroops").OnServerEvent:Connect(function(plr)
	local folder = workspace:WaitForChild(plr.Name.." Troops")
	
	for i, v in pairs(folder:GetChildren()) do
		v:WaitForChild("Attacking").Value = false
	end
end)

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("attack").OnServerEvent:Connect(function(plr, model)
	local folder = workspace:WaitForChild(plr.Name.." Troops")

	for i, v in pairs(folder:GetChildren()) do
		v:WaitForChild("objectToAttack").Value = model
		v:WaitForChild("Attacking").Value = true
	end
end)