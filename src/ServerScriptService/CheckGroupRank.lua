local CheckGroupRank = {}

local groupRanks = {
	ids = {15190011}, -- The Sitdown group
	-- To add a new group, simply add another value to the table
	ranks = {
		{255, 254} -- Host and Developer Ranks
		-- To add ranks:
		-- If you are adding multiple ranks of the same group, then store all of them in
		-- the same table.
		--
		-- If you are adding ranks of different groups, you must create a new table within that one
		-- and the table must correspond with the group IDs in the table above.
	}
}

local players = {
	id = {15190011, 158272651, 85547009} -- LordOfDisco, Axembix, Peteant21
	-- To add a new ID to the list, simply add another value to the table
}

function CheckGroupRank.CheckRank(player)
	local playerId = player.UserId
	
	for i, v in pairs(groupRanks["ids"]) do -- Searches through each of the groups and gets player rank in each group
		local playerRank
		
		local success, err = pcall(function()
			playerRank = player:GetRankInGroup(v)
		end)
		
		if err then
			warn(err)
			
			repeat
				local win, error = pcall(function()
					playerRank = player:GetRankInGroup(v)
				end)
				wait(3)
			until win
		end
		
		local setsOfRanks = groupRanks["ranks"][i]
		for _, rank in pairs(setsOfRanks) do
			if playerRank == rank then -- If the player has one of those ranks then it returns true
				return true
			end
		end
	end
	
	for i, v in pairs(players["id"]) do -- Searches through player ID list
		if playerId == v then
			return true
		end
	end
	
	return false
end

return CheckGroupRank
