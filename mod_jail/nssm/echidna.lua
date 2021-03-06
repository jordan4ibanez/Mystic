nssm:spawn_specific("nssm:echidna", {"default:dirt_with_grass"}, {"default:dirt_with_grass"}, 0, 20, 120, 45000, 1, 22, 31000)
nssm:register_mob("nssm:echidna", {
	type = "monster",
	hp_max = 90,
	hp_min = 90,
	collisionbox = {-0.6, 0.00, -0.6, 0.6, 2, 0.6},
	visual = "mesh",
	mesh = "echidna.x",
	textures = {{"echidnapes.png"}},
	visual_size = {x=6, y=6},
	makes_footstep_sound = true,
	view_range = 30,
	rotate = 270,
	lifetimer = 500,
	walk_velocity = 2,
	run_velocity = 3.5,
	damage = 10,
	jump = true,
    sounds = {
		random = "echidna",
	},
	drops = {
		{name = "nssm:life_energy",
		chance = 1,
		min = 6,
		max = 7,},
		{name = "nssm:snake_scute",
		chance = 1,
		min = 1,
		max = 1,},
	},
	armor = 60,
	drawtype = "front",
	water_damage = 0,
	floats = 1,
	lava_damage = 0,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogshoot",
	dogshoot_stop = true,
	arrow = "nssm:super_gas";
	reach = 5,
	shoot_interval=3,
	animation = {
		speed_normal = 15,
		speed_run = 25,
		stand_start = 60,
		stand_end = 140,
		walk_start = 1,
		walk_end = 40,
		run_start = 1,
		run_end = 40,
		punch_start = 160,
		punch_end = 190,
		dattack_start = 200,
		dattack_end = 240,
	}
})
