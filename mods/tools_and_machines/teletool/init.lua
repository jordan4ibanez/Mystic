if (minetest.get_modpath("intllib")) then
	dofile(minetest.get_modpath("intllib").."/intllib.lua")
	S = intllib.Getter(minetest.get_current_modname())
else
	S = function ( s ) return s end
end

teletool = {}

--[[ Load settings, apply default settings ]]
teletool.settings = {}
teletool.settings.avoid_collisions = true
teletool.settings.adjust_head = true
teletool.settings.cost_mana = 20
local avoid_collisions = minetest.setting_getbool("teletool_avoid_collisions")
if avoid_collisions ~= nil then
	teletool.settings.avoid_collision = avoid_collisions
end
local adjust_head = minetest.setting_getbool("teletool_adjust_head")
if adjust_head ~= nil then
	teletool.settings.adjust_head = adjust_head
end
local cost_mana = tonumber(minetest.setting_get("teletool_cost_mana"))
if cost_mana ~= nil then
	teletool.settings.cost_mana = cost_mana
end


function teletool.teleport(player, pointed_thing)
	local pos = pointed_thing.above
	local src = player:getpos()
	local dest = {x=pos.x, y=math.ceil(pos.y)-0.5, z=pos.z}
	local over = {x=dest.x, y=dest.y+1, z=dest.z}
	local destnode = minetest.get_node({x=dest.x, y=math.ceil(dest.y), z=dest.z})
	local overnode = minetest.get_node({x=over.x, y=math.ceil(over.y), z=over.z})

	if teletool.settings.adjust_head then
		-- This trick prevents the player's head to spawn in a walkable node if the player clicked on the lower side of a node
		-- NOTE: This piece of code must be updated as soon the collision boxes of players become configurable
		if minetest.registered_nodes[overnode.name].walkable then
			dest.y = dest.y - 1
		end
	end

	if teletool.settings.avoid_collisions then
		-- The destination must be collision free
		destnode = minetest.get_node({x=dest.x, y=math.ceil(dest.y), z=dest.z})
		if minetest.registered_nodes[destnode.name].walkable then
			return false
		end
	end

	minetest.add_particlespawner({
		amount = 25,
		time = 0.1,
		minpos = {x=src.x-0.4, y=src.y+0.25, z=src.z-0.4},
		maxpos = {x=src.x+0.4, y=src.y+0.75, z=src.z+0.4},
		minvel = {x=-0.1, y=-0.1, z=-0.1},
		maxvel = {x=0, y=0.1, z=0},
		minexptime=1,
		maxexptime=1.5,
		minsize=1,
		maxsize=1.25,
		texture = "teletool_particle_departure.png",
	})
	minetest.sound_play( {name="teletool_teleport1", gain=1}, {pos=src, max_hear_distance=12})

	player:setpos(dest)
	minetest.add_particlespawner({
		amount = 25,
		time = 0.1,
		minpos = {x=dest.x-0.4, y=dest.y+0.25, z=dest.z-0.4},
		maxpos = {x=dest.x+0.4, y=dest.y+0.75, z=dest.z+0.4},
		minvel = {x=0, y=-0.1, z=0},
		maxvel = {x=0.1, y=0.1, z=0.1},
		minexptime=1,
		maxexptime=1.5,
		minsize=1,
		maxsize=1.25,
		texture = "teletool_particle_arrival.png",
	})
	minetest.after(0.5, function(dest) minetest.sound_play( {name="teletool_teleport2", gain=1}, {pos=dest, max_hear_distance=12}) end, dest)

	return true
end

minetest.register_tool("teletool:teletool_infinite", {
	description = S("infinite point teleporter"),
	range = 20.0,
	tool_capabilities = {},
	wield_image = "teletool_teletool_infinite.png",
	inventory_image = "teletool_teletool_infinite.png",
	on_use = function(itemstack, user, pointed_thing)
		local failure = false
		if(pointed_thing.type == "node") then
			failure = not teletool.teleport(user, pointed_thing)
		else
			failure = true
		end
		if failure then
			minetest.sound_play( {name="teletool_fail", gain=0.5}, {pos=user:getpos(), max_hear_distance=4})
		end
		return itemstack
	end,
})


if(minetest.get_modpath("technic")) then
	technic.register_power_tool("teletool:teletool_technic", 50000)

	minetest.register_tool("teletool:teletool_technic", {
		description = S("electronic point teleporter"),
		range = 20.0,
		tool_capabilities = {},
		wield_image = "teletool_teletool_technic.png",
		inventory_image = "teletool_teletool_technic.png",
		on_use = function(itemstack, user, pointed_thing)
			local failure = false
			if(pointed_thing.type == "node") then
				local meta = minetest.deserialize(itemstack:get_metadata())
				if not meta or not meta.charge then
					failure = true
				elseif meta.charge >= 1000 then
					meta.charge = meta.charge - 1000
					failure = not teletool.teleport(user, pointed_thing)
					if not failure then
						technic.set_RE_wear(itemstack, meta.charge, 50000)
						itemstack:set_metadata(minetest.serialize(meta))
					end
				else
					failure = true
				end
			else
				failure = true
			end
			if failure then
				minetest.sound_play( {name="teletool_fail", gain=0.5}, {pos=user:getpos(), max_hear_distance=4})
			end
			return itemstack
		end,
	
		-- Technic data
		wear_represents = "technic_RE_charge",
		on_refill = technic.refill_RE_charge
	})
end

if(minetest.get_modpath("mana") ~= nil) then
	minetest.register_tool("teletool:teletool_mana", {
		description = S("magical point teleporter"),
		range = 20.0,
		tool_capabilities = {},
		wield_image = "teletool_teletool_mana.png",
		inventory_image = "teletool_teletool_mana.png",
		on_use = function(itemstack, user, pointed_thing)
			local failure = false
			if(pointed_thing.type == "node") then
				if(mana.get(user:get_player_name()) >= teletool.settings.cost_mana) then
					failure = not teletool.teleport(user, pointed_thing)
					if not failure then
						failure = not mana.subtract(user:get_player_name(), teletool.settings.cost_mana)
					end
				else
					failure = true
				end
			else
				failure = true
			end
			if failure then
				minetest.sound_play( {name="teletool_fail", gain=0.5}, {pos=user:getpos(), max_hear_distance=4})
			end
			return itemstack
		end,
	})
end

if(minetest.get_modpath("default") ~= nil and minetest.get_modpath("technic") ~= nil) then
	minetest.register_craft({
		output = "teletool:teletool_technic",
		recipe = {
			{"", "default:mese_crystal", ""},
			{"technic:stainless_steel_ingot", "technic:red_energy_crystal", "technic:stainless_steel_ingot"},
			{"technic:stainless_steel_ingot", "technic:battery", "technic:stainless_steel_ingot"}
		}
	})
end

minetest.register_alias("teletool:teletool", "teletool:teletool_infinite")
