nssm:spawn_specific("nssm:duckking", {"default:dirt_with_grass"}, {"group:flora"}, 10, 20, 120, 3000, 1, -31000, 31000)
nssm:register_mob("nssm:duckking", {
	type = "monster",
	hp_max = 80,
	hp_min = 77,
	collisionbox = {-1.5, -0.25, -1.5, 1.5, 4.95, 1.5},
	visual = "mesh",
	mesh = "king_duck.x",
	textures = {{"king_duck.png"}},
	visual_size = {x=10, y=10},
	lifetimer = 300,
	makes_footstep_sound = true,
	view_range = 30,
	rotate = 270,
	duck_father = true,
	walk_velocity = 1,
	run_velocity = 2,
	damage = 5,
	jump = true,
    sounds = {
		random = "duckking",
		attack = "duckking",
	},
	drops = {
		{name = "nssm:life_energy",
		chance = 1,
		min = 7,
		max = 8,},
		{name = "nssm:duck_legs",
		chance = 1,
		min = 40,
		max = 50,},
		{name = "nssm:king_duck_crown",
		chance = 1,
		min = 1,
		max = 1,},
		{name = "nssm:duck_beak",
		chance = 5,
		min = 10,
		max = 20,},
	},
	armor = 80,
	drawtype = "front",
	water_damage = 0,
	floats = 1,
	lava_damage = 5,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogshoot",
	dogshoot_stop = true,
	arrow = "nssm:duck_father";
		reach = 3,
		shoot_interval=3,
	animation = {
		speed_normal = 15,
		speed_run = 25,
		stand_start = 60,
		stand_end = 140,
		walk_start = 0,
		walk_end = 40,
		run_start = 0,
		run_end = 40,
		punch_start = 190,
		punch_end = 220,
		dattack_start = 160,
		dattack_end = 180,
	}
})
