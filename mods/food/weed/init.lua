--[[

Weed mod (based on wheat and baking mods)
VERSION: 1.0
LICENSE: GPLv3
TODO: 

REQUIRE LIGHT FOR WEED TO GROW

MAKE CRAZY KUSH GIVE YOU CRAZY EFFECTS

]]

weed = {}
weed.grow_interval  = 80 
weed.grow_chance    = 60

weed.required_light = 8


-- Heal the player if they're high - maybe save this state to disk eventually
weed.high = {}
minetest.register_on_joinplayer(function(player)
	weed.high[player:get_player_name()] = {}
	player:hud_add( {
		hud_elem_type = "image",
		position = {x=0, y=0},
		name = "high",
		scale = {x=1000, y=1000},
		text = "weed_high_1.png",
		direction = 0,
		alignment = {x=0, y=0},
		offset = {x=0, y=0},
		size = { x=100, y=100 },
	})
end)
if minetest.setting_getbool("enable_damage") == true then
	minetest.register_globalstep(function(dtime)
		for _,player in ipairs(minetest.get_connected_players()) do
			if weed.high[player:get_player_name()].high == true then
				local playerhp = player:get_hp()
				if playerhp < 16 then
					if weed.high[player:get_player_name()].lasttime == nil then
						weed.high[player:get_player_name()].lasttime = 0
					end
					weed.high[player:get_player_name()].lasttime = weed.high[player:get_player_name()].lasttime + dtime
					
					if weed.high[player:get_player_name()].lasttime > 1 then
						player:set_hp(playerhp + 1)
						weed.high[player:get_player_name()].lasttime = 0
					end
				end
			end
		end
	end)
end




-- nodes and abms
for i = 1,8 do
	
	-- the more grown the higher chance of crop - level 8 always has crop 
	local rarity = (14 - (i*2)) + 1 
	
	if i < 4 then 
		max_items = 0
	elseif i >= 4 and i < 7 then 
		max_items = 1
	elseif i == 7 then
		max_items = 2
	elseif i == 8 then
		max_items = 3
	end
	
    minetest.register_node("weed:weed_" .. i, {
		description = "Weed State " .. i,
		drawtype = "plantlike",
		tile_images = {"weed_state_" .. i .. ".png"},
		inventory_image = "weed_state_" .. i .. ".png",
		paramtype = "light",
		is_ground_content = true,
		walkable = false,
		groups = {snappy = 3,flammable = 2,flower = 1,flora = 1,attached_node = 1},
		drop = {
			max_items = max_items,
			items = {
				{
					items = {"weed:seeds","weed:seeds","weed:nugget"},
					rarity = rarity,
				},
			}
		},
		wall_mounted = false,
		selection_box = {
			type = "fixed",
			fixed = {-1/2, -1/2, -1/2, 1/2, -0.4, 1/2},
		},
	})
	-- Fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "weed:weed_" .. i,
		burntime = 2,
	})
	-- ABM - final level is not abm to avoid cpu usage
	if i < 8 then
		minetest.register_abm({
			nodenames = "weed:weed_" .. i,
			interval = 1,
			chance = 1,
			action = function(pos, node, _, __)
				local nodename = minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z}).name

				if nodename == "farming:soil" or nodename == "farming:soil_wet" then
					minetest.set_node(pos, {name="weed:weed_"..(i+1)})
				end
			end
		})
	end
end




--spawn weed in the world
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.006,
		spread = {x = 100, y = 100, z = 100},
		seed = 329,
		octaves = 3,
		persist = 0.6
	},
	y_min = min,
	y_max = max,
	decoration = "weed:weed_8",
})

-- Nodes end
minetest.register_node("weed:wild_grass", {
	    drawtype = "plantlike",
	    paramtype = "facedir_simple",
        tile_images = {"weed_weed_4.png"},
	    inventory_image = "weed_weed_4.png",
	    paramtype = "light",
	    is_ground_content = true,
	    walkable = false,
        groups = {dig_immediate=3,choppy=3},
		drop = {
			max_items = 1,
			items = {
				{
					items = {'weed:weed_nug'},
					rarity = 10,
				},
			},
		},
        visual_scale = PLANTS_VISUAL_SCALE,
        selection_box = {
    		type = "fixed",
    		fixed = {-1/2, -1/2, -1/2, 1/2, -0.3, 1/2},
    	},
})


-- bong
minetest.register_node("weed:bong", {
	description = "Bong",
	tiles = {"weed_bong.png"},
	paramtype  = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	groups   = {dig_immediate = 3, falling_node = 1},
	node_box = {
				type = "fixed",
				fixed = {
						{-0.2, -0.5, -0.2, 0.2, -0.1, 0.2}, -- Water chamber
						{-0.1, -0.1, -0.1, 0.1, 0.5, 0.1},  -- Mouth Piece
						{-0.1, -0.2, -0.4, 0.1, -0.4, -0.2},-- Stem
						}
			},
})

minetest.register_tool("weed:bong_item", {
	description = "Bong",
	inventory_image = "weed_bong.png",
	wield_image = "weed_bong.png",
	groups = {not_in_creative_inventory=0},
	on_place=function(itemstack, user, pointed_thing)
		--portalgun_mode(itemstack, user, pointed_thing)
		--return itemstack
		print("place")
	end,
	on_use = function(itemstack, user, pointed_thing)
		--portalgun_onuse(itemstack, user, pointed_thing)
		--return itemstack
		print("use")
	end
})

------
minetest.register_craftitem("weed:seeds", {
	description = "Weed Seeds",
	image = "weed_seeds.png",
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "weed:weed_1")
	end,
})

minetest.register_craftitem("weed:nugget", {
	image = "weed_nugget.png",
})

--[[
minetest.register_craftitem("weed:flour", {
	image = "weed_flour.png",
	on_place = minetest.item_place
})


minetest.register_craftitem("weed:brownie", {
	description = "Weed Brownie",
	image = "weed_brownie.png",
	on_place = minetest.item_place,
	on_use = minetest.item_eat(9)
})
minetest.register_craftitem("weed:weed_cigarette", {
	image = "cigarette.png",
	on_place = minetest.item_place,
	on_use = minetest.item_eat(1)
})
minetest.register_craftitem("weed:brownie_dough", {
	image = "weed_brownie_dough.png",
	on_place = minetest.item_place,
})

minetest.register_craft({
	output = 'weed:flour 1',
	recipe = {
		{'weed:weed_nug', 'weed:weed_nug'},
		{'weed:weed_nug', 'weed:weed_nug'},
	}
})

minetest.register_craft({
	output = 'weed:brownie_dough 1',
	recipe = {
		{'weed:flour', 'weed:flour', 'weed:flour'},
		{'weed:flour', 'weed:weed_form_water', 'weed:flour'},
		{'weed:flour', 'weed:flour', 'weed:flour'},
	}
})

minetest.register_craft({
	output = 'weed:weed_form_empty 1',
	recipe = {
		{'default:wood', '', 'default:wood'},
		{'', 'default:wood', ''},
	}
})
minetest.register_craft({
	output = 'weed:weed_cigarette',
	recipe = {
		{'default:paper'},
		{'weed:weed_nug'},
	}
})



minetest.register_craft({
    type = "cooking",
    output = "weed:brownie",
    recipe = "weed:brownie_dough",
    cooktime = 10,
	replacements = {
        {"weed:brownie_dough", "weed:weed_form_empty"},  --- this is not work!!!
    },
})

minetest.register_node("weed:poop", {
	description = "Weed poop",
	drawtype = "plantlike",
	tile_images = {"weed_state_1.png"},
	inventory_image = "weed_state_1.png",
})
]]--
print("[weed mod] Loaded!")
