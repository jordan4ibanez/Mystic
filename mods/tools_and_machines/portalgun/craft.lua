

minetest.register_craft({
	output = "portalgun:powerdoor1_1",
	recipe = {
		{"default:obsidian_glass", "default:mese_crystal", "default:obsidian_glass"},
		{"default:obsidian_glass", "default:obsidian", "default:obsidian_glass"},
		{"default:obsidian_glass", "default:mese_crystal", "default:obsidian_glass"},
	}
})

minetest.register_craft({
	output = "portalgun:autocheckpoint",
	recipe = {
		{"default:mese_crystal", "default:mese_crystal","default:mese_crystal"},
	}
})

minetest.register_craft({
	output = "portalgun:testblock 3",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "dye:white"},
	}
})

minetest.register_craft({
	output = "portalgun:apb",
	recipe = {
		{"default:stonebrick", "dye:white"},
	}
})

minetest.register_craft({
	output = "portalgun:secam_off",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"dye:black", "default:glass", "dye:black"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
	}
})
minetest.register_craft({
	output = "portalgun:robot",
	recipe = {
		{"", "portalgun:secam_off", ""},
		{"", "default:steel_ingot", ""},
		{"default:steel_ingot", "", "default:steel_ingot"},
	}
})


minetest.register_craft({
	output = "portalgun:powerballspawner",
	recipe = {
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"dye:yellow", "default:mese_crystal", "dye:yellow"},
		{"default:steel_ingot", "", "default:steel_ingot"},
	}
})
minetest.register_craft({
	output = "portalgun:powerballtarget",
	recipe = {
		{"portalgun:powerballspawner"},
	}
})

minetest.register_craft({output = "portalgun:wscspawner2",
	recipe = {{"portalgun:wscspawner1"}}})
minetest.register_craft({output = "portalgun:wscspawner3",
	recipe = {{"portalgun:wscspawner2"}}})
minetest.register_craft({output = "portalgun:wscspawner4",
	recipe = {{"portalgun:wscspawner3"}}})
minetest.register_craft({output = "portalgun:wscspawner1",
	recipe = {{"portalgun:wscspawner4"}}})
minetest.register_craft({
	output = "portalgun:wscspawner1",
	recipe = {
		{"", "default:steel_ingot", ""},
		{"default:steel_ingot", "default:mese_crystal", "default:steel_ingot"},
		{"", "default:steel_ingot", ""},}})

minetest.register_craft({output = "portalgun:wscspawner2_2",
	recipe = {{"portalgun:wscspawner2_1"}}})
minetest.register_craft({output = "portalgun:wscspawner2_3",
	recipe = {{"portalgun:wscspawner2_2"}}})
minetest.register_craft({output = "portalgun:wscspawner2_4",
	recipe = {{"portalgun:wscspawner2_3"}}})
minetest.register_craft({output = "portalgun:wscspawner2_1",
	recipe = {{"portalgun:wscspawner2_4"}}})
minetest.register_craft({
	output = "portalgun:wscspawner2_1",
	recipe = {
		{"", "default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:mese_crystal", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},}})

minetest.register_craft({
	output = "portalgun:plantform1_1",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:mese_crystal", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},}})
minetest.register_craft({output = "portalgun:plantform1_2",
	recipe = {{"portalgun:plantform1_1"}}})
minetest.register_craft({output = "portalgun:plantform1_3",
	recipe = {{"portalgun:plantform1_2"}}})
minetest.register_craft({output = "portalgun:plantform1_4",
	recipe = {{"portalgun:plantform1_3"}}})
minetest.register_craft({output = "portalgun:plantform1_1",
	recipe = {{"portalgun:plantform1_4"}}})

minetest.register_craft({
	output = "portalgun:portalgun_node1",
	recipe = {{"portalgun:gun1"}}})
minetest.register_craft({
	output = "portalgun:portalgun_node2",
	recipe = {{"portalgun:gun2"}}})
minetest.register_craft({
	output = "portalgun:portalgun_node",
	recipe = {{"portalgun:gun"}}})

minetest.register_craft({
	output = "portalgun:gun",
	recipe = {
		{"", "default:diamond", ""},
		{"default:diamond", "default:mese", "default:mese"},
		{"", "default:steel_ingot", "default:steel_ingot"},
	},
})