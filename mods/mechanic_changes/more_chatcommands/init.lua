
--
-- Chat commands
--

local function execute_chatcommand(pname, cmd)
	for _,func in pairs(minetest.registered_on_chat_messages) do
		func(pname, cmd)
	end
end

minetest.register_chatcommand("grantme", {
	params = "<privilege>|all",
	description = "Give privilege to yourself",
	func = function(name, param)
		if param == "" then
			return false, "Invalid parameters (see /help grantme)."
		end
		execute_chatcommand(name, "/grant "..name.." "..param)
	end,
})

minetest.register_chatcommand("grantall", {
	params = "<privilege>|all",
	description = "Give privilege to all players online",
	func = function(name, param)
		if param == "" then
			return false, "Invalid parameters (see /help grantall)"
		end
		for _,player in pairs(minetest.get_connected_players()) do
			local playername = player:get_player_name()
			execute_chatcommand(name, "/grant "..playername.." "..param)
		end

		minetest.log("action", name..' granted everyone ('..param..')')
		return true, "You granted everyone: "..param
	end,
})

minetest.register_chatcommand("kickall", {
	params = "[reason]",
	description = "kick all player but the caller",
	privs = {kick=true},
	func = function(name, reason)
		for _,player in pairs(minetest.get_connected_players()) do
			local tokick = player:get_player_name()
			if tokick ~= name then
				execute_chatcommand(name, "/kick "..tokick.." "..reason)
			end
		end
		local log_message = name .. " kicks everyone"
		if reason
		and reason ~= "" then
			log_message = log_message.." with reason \"" .. reason .. "\""
		end
		minetest.log("action", log_message)
		return true, "Kicked everyone but you"
	end,
})

minetest.register_chatcommand("revokeall", {
	params = "<privilege>|all",
	description = "Revoke privilege from all other players online",
	func = function(name, param)
		if param == "" then
			return false, "Invalid parameters (see /help revokeall)"
		end
		for _,player in pairs(minetest.get_connected_players()) do
			local playername = player:get_player_name()
			if playername ~= name then
				execute_chatcommand(name, "/revoke "..playername.." "..param)
			end
		end

		minetest.log("action", name..' revoked ('..param..') from everyone')
		return true, "You revoked:"..param.." from everyone"
	end,
})

minetest.register_chatcommand("revokeme", {
	params = "<privilege>|all",
	description = "Revoke privilege from yourself",
	func = function(name, param)
		if param == "" then
			return false, "Invalid parameters (see /help revokeall)"
		end
		execute_chatcommand(name, "/revoke "..name.." "..param)
	end,
})

minetest.register_chatcommand("giveall", {
	params = "<privilege>|all",
	description = "Give item to all players online",
	func = function(name, param)
		if param == "" then
			return false, "Invalid parameters (see /help giveall)"
		end
		for _,player in pairs(minetest.get_connected_players()) do
			local playername = player:get_player_name()
			execute_chatcommand(name, "/give "..playername.." "..param)
		end

		minetest.log("action", name..' given everyone ('..param..')')
		return true, "You given everyone: "..param
	end,
})