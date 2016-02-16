--[[
####mountain berries

###snow berries

strawberries

######raspberries

####desert berries

acacia bush (savana)

make bushes drop fruits on right click and regrow fruits over time (abm)

]]--

berries_func = {}
berries_func.octaves       = 5
berries_func.scale         = 0.01

berries_func.common_offset = -0.001
berries_func.common_spread = 100
berries_func.common_persist= 0.1


local seed = minetest.get_mapgen_params().seed







--snowberry bush
minetest.register_node("bushes:snowberry", {
	description = "Snowberry Bush",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_leaves.png^snowberry_bush.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, leaves = 1},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		minetest.set_node(pos, {name="bushes:snowberry_empty"})
		pos.y = pos.y + 0.5
		minetest.spawn_item(pos, "bushes:snowberries")
	end,
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_node("bushes:snowberry_empty", {
	description = "Snowberry Bush",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_leaves.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, leaves = 1},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_abm({
	nodenames = {"bushes:snowberry_empty"},
	neighbors = {"air"},
	interval = 30.0,
	chance = 3,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node(pos, {name = "bushes:snowberry"})
	end,
})
local snowberrybush = {}
for j=1, 3*4*3 do
	table.insert(snowberrybush, { name = "bushes:snowberry" })
end
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_snow"},
	sidelen = 16,
		noise_params = {
			offset = berries_func.common_offset, --rarity
			scale = berries_func.scale,
			spread = {x = berries_func.common_spread, y = berries_func.common_spread, z = berries_func.common_spread},
			seed = seed,
			octaves = berries_func.octaves,
			persist = berries_func.common_persist
		},
	--biomes = {"deciduous_forest"},
	--y_min = 1,
	--y_max = 50,
	schematic = {
		size = { x = 3, y = 4, z = 3},
		data = snowberrybush,
	},
	flags = "place_center_x",
})








--blueberry bush
minetest.register_node("bushes:blueberry", {
	description = "Blueberry Bush",
	drawtype = "allfaces_optional",
	waving = 1,
	--visual_scale = 1.3,
	tiles = {"default_leaves.png^blueberry_bush.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, leaves = 1},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		minetest.set_node(pos, {name="bushes:blueberry_empty"})
		pos.y = pos.y + 0.5
		minetest.spawn_item(pos, "bushes:blueberries")
	end,
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_node("bushes:blueberry_empty", {
	description = "Blueberry Bush",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_leaves.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, leaves = 1},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_abm({
	nodenames = {"bushes:blueberry_empty"},
	neighbors = {"air"},
	interval = 30.0,
	chance = 3,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node(pos, {name = "bushes:blueberry"})
	end,
})
local blueberrybush = {}
for j=1, 3*4*3 do
	table.insert(blueberrybush, { name = "bushes:blueberry" })
end
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
		noise_params = {
			offset = berries_func.common_offset, --rarity
			scale = berries_func.scale,
			spread = {x = berries_func.common_spread, y = berries_func.common_spread, z = berries_func.common_spread},
			seed = seed,
			octaves = berries_func.octaves,
			persist = berries_func.common_persist
		},
	--biomes = {"deciduous_forest"},
	--y_min = 1,
	y_max = 50,
	schematic = {
		size = { x = 3, y = 4, z = 3},
		data = blueberrybush,
	},
	flags = "place_center_x",
})











--raspberry bush
minetest.register_node("bushes:raspberry", {
	description = "Raspberry Bush",
	drawtype = "allfaces_optional",
	waving = 1,
	--visual_scale = 1.3,
	tiles = {"default_leaves.png^raspberry_bush.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, leaves = 1},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		minetest.set_node(pos, {name="bushes:raspberry_empty"})
		pos.y = pos.y + 0.5
		minetest.spawn_item(pos, "bushes:raspberries")
	end,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("bushes:raspberry_empty", {
	description = "Raspberry Bush",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_leaves.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, leaves = 1},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_abm({
	nodenames = {"bushes:raspberry_empty"},
	neighbors = {"air"},
	interval = 30.0,
	chance = 3,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node(pos, {name = "bushes:raspberry"})
	end,
})

local raspberrybush = {}
for j=1, 3*4*3 do
	table.insert(raspberrybush, { name = "bushes:raspberry" })
end
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
		noise_params = {
			offset = berries_func.common_offset, --rarity
			scale = berries_func.scale,
			spread = {x = berries_func.common_spread, y = berries_func.common_spread, z = berries_func.common_spread},
			seed = seed,
			octaves = berries_func.octaves,
			persist = berries_func.common_persist
		},
	--biomes = {"deciduous_forest"},
	--y_min = 1,
	y_max = 50,
	schematic = {
		size = { x = 3, y = 4, z = 3},
		data = blueberrybush,
	},
	flags = "place_center_x",
})













--mountainberry bush
minetest.register_node("bushes:mountainberry", {
	description = "Mountainberry Bush",
	drawtype = "allfaces_optional",
	waving = 1,
	--visual_scale = 1.3,
	tiles = {"default_leaves.png^mountainberry_bush.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, leaves = 1},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		minetest.set_node(pos, {name="bushes:mountainberry_empty"})
		pos.y = pos.y + 0.5
		minetest.spawn_item(pos, "bushes:mountainberries")
	end,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("bushes:mountainberry_empty", {
	description = "Mountainberry Bush",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_leaves.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, leaves = 1},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_abm({
	nodenames = {"bushes:mountainberry_empty"},
	neighbors = {"air"},
	interval = 30.0,
	chance = 3,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node(pos, {name = "bushes:mountainberry"})
	end,
})

local mountainberrybush = {}
for j=1, 3*4*3 do
	table.insert(mountainberrybush, { name = "bushes:mountainberry" })
end
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass", "default:dirt_with_snow"},
	sidelen = 16,
		noise_params = {
			offset = -0.01, --rarity
			scale = berries_func.scale,
			spread = {x = 100, y = 100, z = 100},
			seed = seed,
			octaves = 5,
			persist = 0.6
		},
	--biomes = {"deciduous_forest"},
	y_min = 50,
	y_max = 500,
	schematic = {
		size = { x = 3, y = 4, z = 3},
		data = mountainberrybush,
	},
	flags = "place_center_x",
})










--desertberry bush
minetest.register_node("bushes:desertberry", {
	description = "Desertberry Bush",
	drawtype = "allfaces_optional",
	waving = 1,
	--visual_scale = 1.3,
	tiles = {"default_leaves.png^desertberry_bush.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, leaves = 1},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		minetest.set_node(pos, {name="bushes:desertberry_empty"})
		pos.y = pos.y + 0.5
		minetest.spawn_item(pos, "bushes:desertberries")
	end,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("bushes:desertberry_empty", {
	description = "Desertberry Bush",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_leaves.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, leaves = 1},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_abm({
	nodenames = {"bushes:desertberry_empty"},
	neighbors = {"air"},
	interval = 30.0,
	chance = 3,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node(pos, {name = "bushes:desertberry"})
	end,
})

local desertberrybush = {}
for j=1, 3*4*3 do
	table.insert(desertberrybush, { name = "bushes:desertberry" })
end
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"bushes:desert_sand","default:dirt_with_dry_grass"},
	sidelen = 16,
		noise_params = {
			offset = berries_func.common_offset, --rarity
			scale = berries_func.scale,
			spread = {x = berries_func.common_spread, y = berries_func.common_spread, z = berries_func.common_spread},
			seed = seed,
			octaves = berries_func.octaves,
			persist = berries_func.common_persist
		},
	biomes = {"desert", "savanna"},
	--y_min = 1,
	--y_max = 50,
	schematic = {
		size = { x = 3, y = 4, z = 3},
		data = desertberrybush,
	},
	flags = "place_center_x",
})










--strawberry bush
minetest.register_node("bushes:strawberry", {
	description = "Strawberry Bush",
	drawtype = "allfaces_optional",
	waving = 1,
	--visual_scale = 1.3,
	tiles = {"default_leaves.png^strawberry_bush.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, leaves = 1},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		minetest.set_node(pos, {name="bushes:strawberry_empty"})
		pos.y = pos.y + 0.5
		minetest.spawn_item(pos, "bushes:strawberries")
	end,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("bushes:strawberry_empty", {
	description = "Strawberry Bush",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_leaves.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, leaves = 1},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_abm({
	nodenames = {"bushes:strawberry_empty"},
	neighbors = {"air"},
	interval = 30.0,
	chance = 3,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node(pos, {name = "bushes:strawberry"})
	end,
})
local strawberrybush = {}
for j=1, 3*4*3 do
	table.insert(strawberrybush, { name = "bushes:strawberry" })
end
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
		noise_params = {
			offset = berries_func.common_offset, --rarity
			scale = berries_func.scale,
			spread = {x = berries_func.common_spread, y = berries_func.common_spread, z = berries_func.common_spread},
			seed = seed,
			octaves = berries_func.octaves,
			persist = berries_func.common_persist
		},
	--biomes = {"deciduous_forest"},
	--y_min = 1,
	--y_max = 50,
	schematic = {
		size = { x = 3, y = 4, z = 3},
		data = strawberrybush,
	},
	flags = "place_center_x",
})


minetest.register_craftitem("bushes:snowberries", {
	description = "Snowberries",
	inventory_image = "snowberry_bush.png",
	on_use = minetest.item_eat(1),
})

minetest.register_craftitem("bushes:blueberries", {
	description = "Blueberries",
	inventory_image = "blueberry_bush.png",
	on_use = minetest.item_eat(1),
})


minetest.register_craftitem("bushes:raspberries", {
	description = "Raspberries",
	inventory_image = "raspberry_bush.png",
	on_use = minetest.item_eat(1),
})

minetest.register_craftitem("bushes:desertberries", {
	description = "Desertberries",
	inventory_image = "desertberry_bush.png",
	on_use = minetest.item_eat(1),
})


minetest.register_craftitem("bushes:mountainberries", {
	description = "Mountainberries",
	inventory_image = "mountainberry_bush.png",
	on_use = minetest.item_eat(1),
})


minetest.register_craftitem("bushes:strawberries", {
	description = "Strawberries",
	inventory_image = "strawberry_bush.png",
	on_use = minetest.item_eat(1),
})

