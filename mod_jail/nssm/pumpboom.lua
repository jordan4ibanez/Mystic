nssm:spawn_specific("nssm:pumpboom_small", {"default:dirt_with_grass", "default:dirt_with_snow","default:snowblock"}, {"default:pine_tree"}, 0, 20, 30, 300, 1, -31000, 31000)
nssm:spawn_specific("nssm:pumpboom_medium", {"default:dirt_with_grass", "default:dirt_with_snow","default:snowblock"}, {"default:pine_tree"}, 0, 20, 30, 400, 1, -31000, 31000)
nssm:spawn_specific("nssm:pumpboom_large", {"default:dirt_with_grass", "default:dirt_with_snow","default:snowblock"}, {"default:pine_tree"}, 0, 20, 30, 500, 1, -31000, 31000)

nssm:register_mob("nssm:pumpboom_small", {
	type = "monster",
	hp_max = 15,
	hp_min = 14,
	collisionbox = {-0.80, -0.3, -0.80, 0.80, 0.80, 0.80},
	visual = "mesh",
	mesh = "pumpboom.x",
	rotate = 270,
	textures = {{"pumpboom.png"}},
	visual_size = {x=3, y=3},
	explosion_radius = 4,
	makes_footstep_sound = true,
	view_range = 20,
	walk_velocity = 2,
	run_velocity = 2.5,
    sounds = {
    explode = "tnt_explode"
	},
	damage = 1.5,
	jump = true,
	drops = {
		{name = "nssm:life_energy",
		chance = 1,
		min = 1,
		max = 2,}
	},
	armor = 100,
	drawtype = "front",
	water_damage = 2,
	lava_damage = 5,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "explode",
	animation = {
		speed_normal = 25,
		speed_run = 25,
		stand_start = 1,
		stand_end = 30,
		walk_start = 81,
		walk_end = 97,
		run_start = 81,
		run_end = 97,
		punch_start = 70,
		punch_end = 80,
	}
})

nssm:register_mob("nssm:pumpboom_medium", {
	type = "monster",
	hp_max = 18,
	hp_min = 17,
	collisionbox = {-0.80, -0.3, -0.80, 0.80, 0.80, 0.80},
	visual = "mesh",
	mesh = "pumpboom.x",
	rotate = 270,
	textures = {{"pumpboom.png"}},
	visual_size = {x=5, y=5},
	makes_footstep_sound = true,
	view_range = 25,
	walk_velocity = 2,
	explosion_radius = 6,
	run_velocity = 2.5,
    sounds = {
    explode = "tnt_explode"
	},
	damage = 1.5,
	jump = true,
	drops = {
		{name = "nssm:life_energy",
		chance = 1,
		min = 2,
		max = 3,}
	},
	armor = 100,
	drawtype = "front",
	water_damage = 2,
	lava_damage = 5,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "explode",
	animation = {
		speed_normal = 25,
		speed_run = 25,
		stand_start = 1,
		stand_end = 30,
		walk_start = 81,
		walk_end = 97,
		run_start = 81,
		run_end = 97,
		punch_start = 70,
		punch_end = 80,
	}
})

nssm:register_mob("nssm:pumpboom_large", {
	type = "monster",
	hp_max = 20,
	hp_min = 19,
	collisionbox = {-0.80, -0.3, -0.80, 0.80, 0.80, 0.80},
	visual = "mesh",
	mesh = "pumpboom.x",
	rotate = 270,
	explosion_radius = 8,
	textures = {{"pumpboom.png"}},
	visual_size = {x=8, y=8},
	makes_footstep_sound = true,
	view_range = 30,
	walk_velocity = 2,
	run_velocity = 3,
    sounds = {
    explode = "tnt_explode"
	},
	damage = 1.5,
	jump = true,
	drops = {
		{name = "nssm:life_energy",
		chance = 1,
		min = 3,
		max = 4,}
	},
	armor = 100,
	drawtype = "front",
	water_damage = 2,
	lava_damage = 5,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "explode",
	animation = {
speed_normal = 25,
		speed_run = 25,
		stand_start = 1,
		stand_end = 30,
		walk_start = 81,
		walk_end = 97,
		run_start = 81,
		run_end = 97,
		punch_start = 70,
		punch_end = 80,
	}
})