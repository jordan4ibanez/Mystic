-- rnd 2015, power outlet
-- used to power basic_machines using remaining available power from technic:switching_station. Just place it below mover but within 10 block distance of technich switching station. Each power outlet adds 500 to the power demand. If switching station has not enough unused power ( after technic machines demand), it wont supply power to mover.

local outlet_power_demand = 300;


minetest.register_node("basic_machines:outlet", {
	description = "Power outlet",
	tiles = {"outlet.png"},
	groups = {oddly_breakable_by_hand=2,mesecon_effector_on = 1},
	sounds = default.node_sound_wood_defaults(),
	after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos);
		meta:set_string("infotext", "Outlet: put it below mover and near (10 blocks) technic switching station. If switching station has at least 300 free supply it will be used to power mover")
		local r = 10;
		local positions = minetest.find_nodes_in_area(
		{x=pos.x-r, y=pos.y-r, z=pos.z-r},
		{x=pos.x+r, y=pos.y+r, z=pos.z+r},
		"technic:switching_station")
		if not positions then 
			meta:set_string("infotext","outlet: error. please place it near technic switching station (within 10 blocks distance)"); return 
		end
		
		local p = positions[1]; if not p then return end
		local smeta = minetest.get_meta(p);
		local bdemand = smeta:get_int("bdemand") or 0;
		bdemand = bdemand + outlet_power_demand; smeta:set_int("bdemand", bdemand);
		--minetest.chat_send_all("demand "..bdemand);
		meta:set_string("infotext","outlet connected to switching station at "..p.x .. " " .. p.y .. " " .. p.z);
		
		meta:set_string("station",minetest.pos_to_string(p)); -- remember where station is
	end,
	
	after_dig_node = function(pos, oldnode, oldmetadata, digger) -- remove demand from switching station
		local r = 10;
		local positions = minetest.find_nodes_in_area(
		{x=pos.x-r, y=pos.y-r, z=pos.z-r},
		{x=pos.x+r, y=pos.y+r, z=pos.z+r},
		"technic:switching_station")
		if not positions then return end
		
		local p = positions[1]; if not p then return end
		local smeta = minetest.get_meta(p);
		local bdemand = smeta:get_int("bdemand") or 0;
		bdemand = math.max(bdemand - outlet_power_demand,0); smeta:set_int("bdemand", bdemand);
		--minetest.chat_send_all("demand "..bdemand);
	end
	
})

function basic_machines.check_power(pos) -- mover checks power source
	if minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z}).name ~= "basic_machines:outlet"
		then return 0 
	end
	
	local meta = minetest.get_meta({x=pos.x,y=pos.y-1,z=pos.z});
	local p = minetest.string_to_pos(meta:get_string("station")); if not p then return end
	local smeta =  minetest.get_meta(p); if not smeta then return end
	local infot = smeta:get_string("infotext");
	--local infot = "Switching Station. Supply: 516 Demand: 0";	
	local i = string.find(infot,"Supply") or 1;
	local j = string.find(infot,"Demand") or 1;
	local supply = tonumber(string.sub(infot,i+8,j-1)) or 0;
	local demand = tonumber(string.sub(infot, j+8)) or 0;
	supply= supply-demand-(smeta:get_int("bdemand") or 999999);
	if supply>0 then 
		return supply
		else return 0 
	end
end



minetest.register_craft({
	output = "basic_machines:outlet",
	recipe = {
		{"default:mese_crystal","default:steel_ingot","default:mese_crystal"},
		{"default:mese_crystal","default:diamondblock","default:mese_crystal"},
		{"default:mese_crystal","default:mese_crystal","default:mese_crystal"},
		
	}
})