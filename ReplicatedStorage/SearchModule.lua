-- @ScriptType: ModuleScript
local SearchFunctions = {}


function GetAllItems(guiContainer: Frame | ScrollingFrame)

	local itemFrames = {}

	for _, child in pairs(guiContainer:GetChildren()) do

		if child:FindFirstChild("SearchTags") then

			table.insert(itemFrames, child)
		end
	end

	return itemFrames
end

function GetSearchTags(itemFrames: {})

	local itemTags = {}

	for _, itemFrame in pairs(itemFrames) do

		itemTags[itemFrame] = {}

		if itemFrame:FindFirstChild("SearchTags") then

			for __, searchTag in pairs(itemFrame.SearchTags:GetChildren()) do

				local tag = searchTag.Value
				tag = string.lower(tag)

				table.insert(itemTags[itemFrame], tag)
			end
		end
	end

	return itemTags
end

function SelectItems(query: {}, itemTags: {})

	local selectionRanked = {}

	for itemFrame, searchTags in pairs(itemTags) do

		local queryCopy = table.clone(query)

		for _, tag in pairs(searchTags) do

			for wordIndex, queriedWord in pairs(queryCopy) do
				
				if string.find(tag, queriedWord, 1, true) then
					table.remove(queryCopy, wordIndex)

					break
				end
			end
		end

		if #queryCopy == 0 then
			table.insert(selectionRanked, {itemFrame, #query})
		end
	end

	table.sort(selectionRanked, function(a, b)
		return a[2] > b[2]
	end)

	local selection = {}

	for _, selectionPair in ipairs(selectionRanked) do
		table.insert(selection, selectionPair[1])
	end

	return selection
end

function DisplaySelection(selection: {}, guiContainer: Frame | ScrollingFrame)

	if not selection then 
		selection = guiContainer:GetChildren()
	end

	for _, child in pairs(guiContainer:GetChildren()) do

		if child:FindFirstChild("SearchTags") then

			if table.find(selection, child) and child.Name ~= "template" then
				child.Visible = true

			else
				child.Visible = false
			end
		end
	end
end

function GetSearchQuery(searchBar: TextBox)

	local text = searchBar.Text
	text = string.lower(text)

	if text == "" then 

		text = nil 

	else

		text = string.split(text, " ")

		for wordIndex, word in pairs(text) do

			if word == "" or word == " " then
				table.remove(text, wordIndex)
			end
		end
	end

	return text
end

function OnSearched(searchBar: TextBox, guiContainer: Frame | ScrollingFrame)

	local searchText = GetSearchQuery(searchBar)

	if not searchText then

		DisplaySelection(nil, guiContainer)

	else

		local allItems = GetAllItems(guiContainer)
		local allSearchTags = GetSearchTags(allItems)
		local selection = SelectItems(searchText, allSearchTags)

		DisplaySelection(selection, guiContainer)
	end
end

function SetupSearchBar(searchBar: TextBox, guiContainer: Frame)
	
	OnSearched(searchBar, guiContainer)
	
	searchBar:GetPropertyChangedSignal("Text"):Connect(function()
		
		OnSearched(searchBar, guiContainer)
	end)
end


return SetupSearchBar