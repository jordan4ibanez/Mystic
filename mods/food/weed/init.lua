--[[

Weed mod (based on wheat and baking mods)
VERSION: 0.0.2
LICENSE: GPLv3
TODO: 

]]

PLANTS_GROW_INTERVAL = 80 -- interval in ABMs for plants
PLANTS_GROW_CHANCE = 60 -- chance in ABMs for plants
PLANTS_VISUAL_SCALE = 1 -- visualscale for plants







local LIGHT = 5 -- amount of light neded to weed grow

-- ABMs
--[[
minetest.register_abm({
    nodenames = {"weed:weed_1","weed:weed_2","weed:weed_3","weed:weed_4",
                                           "weed:weed_5","weed:weed_6","weed:weed_7"},
    interval = PLANTS_GROW_INTERVAL/3*2,
    chance = PLANTS_GROW_CHANCE/2,
        action = function(pos, node, _, __)
            local l = minetest.env:get_node_light(pos, nil)
            local p = pos
            local rnd = math.random(1, 3)
            p.y = p.y - 1 -- it will change pos too, that cause using p.y = p.y + 1
            local under_node = minetest.env:get_node(p)
            if (l >= LIGHT) and (under_node.name == "weed:dirt_bed") and (rnd == 1) then
                local nname  --= 'weed:weed_final' 
                if node.name == "weed:weed_1" then 

                        nname = 'weed:weed_2'

                elseif node.name == "weed:weed_2" then

                        nname = 'weed:weed_3'

                elseif  node.name == 'weed:weed_3' then

                        nname = 'weed:weed_4'

                elseif  node.name == 'weed:weed_4' then

                        nname = 'weed:weed_5'

                elseif  node.name == 'weed:weed_5' then

                        nname = 'weed:weed_6'

                elseif  node.name == 'weed:weed_6' then

                        nname = 'weed:weed_7'
                    
                else nname = 'weed:weed_final' end
                p.y = p.y + 1
                minetest.env:remove_node(pos)
                minetest.env:add_node(pos, { name = nname })
            end
        end
}) 

minetest.register_abm({
    nodenames = NODES_TO_DELETE_IF_THEY_ABOVE_AIR,
    interval = 3,
    chance = 1,
        action = function(pos, node, _, __)
            local p = {x = pos.x,y = pos.y -1,z = pos.z}
            --p.y = p.y - 1 -- it will change pos too, that cause using p.y = p.y + 1
            local under_node = minetest.env:get_node(p)
            if (under_node.name == "air") then
                --p.y = p.y + 1
                minetest.env:remove_node(pos)
                minetest.env:add_node(p, {name = node.name})
            end
        end
})
minetest.register_abm({
    nodenames = "weed:dirt_bed",
    interval = 40,
    chance = 3,
        action = function(pos, node, _, __)
            local p = {x = pos.x,y = pos.y +1,z = pos.z}
            local above_node = minetest.env:get_node(p)

            for i, plant in ipairs(DIRT_BED_TO_GRASS) do
                if (above_node.name == plant) then return; end             
            end
            minetest.env:remove_node(pos)
            minetest.env:add_node(pos, {name = "weed:dirt_bed"})
        end
})-- ABMs end
]]--

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
					items = {},
					rarity = rarity,
				},
				{
					items = {'default:dirt'},
					rarity = rarity,
				}
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
end



minetest.register_node("weed:big_grass", {
	    drawtype = "plantlike",
	    paramtype = "facedir_simple",
        tile_images = {"weed_weed_final.png"},
	    inventory_image = "weed_weed_final.png",
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
	--spawn_by = spawnby,
	--num_spawn_by = num,
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



------

minetest.register_craftitem("weed:flour", {
	image = "weed_flour.png",
	on_place = minetest.item_place
})

minetest.register_craftitem("weed:seeds", {
	description = "Weed Seeds",
	image = "weed_seeds.png",
	on_place = minetest.item_place,
	on_use = minetest.item_eat(-1)
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

print("[weed mod] Loaded!")
