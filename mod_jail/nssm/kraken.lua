nssm:spawn_specific("nssm:kraken", {"default:water_source"}, {"default:water_source"}, 0, 20, 120, 90000, 1, -31000, 0)
nssm:register_mob("nssm:kraken", {
	type = "monster",
	hp_max = 150,
	hp_min = 150,
	collisionbox = {-2, 0, -2, 2, 4, 2},
	visual = "mesh",
	mesh = "kraken.x",
	textures = {{"kraken.png"}, {"kraken2.png"}},
	visual_size = {x=15, y=15},
	lifetimer=500,
	inker = false,
	view_range = 50,
	fly = true,
	fly_in = "default:water_source",
	fall_speed = -1,
	walk_velocity = 3.5,
	run_velocity = 4.5,
	damage = 8,
	rotate = 270,
	jump = false,
	jump_chance = 0,
	jump_height = 0,
  sounds = {
		random = "kraken",
	},
	drops = {
			{name = "nssm:life_energy",
		chance = 1,
		min = 6,
		max = 7,},
		{name = "nssm:tentacle",
		chance = 1,
		min = 30,
		max = 40,},
		{name = "nssm:tentacle_curly",
		chance = 1,
		min = 1,
		max = 1,},
	},
	armor = 70,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 10,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogfight",
	reach=8,
	animation = {
		speed_normal = 20,
		speed_run = 30,
		stand_start = 1,
		stand_end = 40,
		walk_start = 60,
		walk_end = 100,
		run_start = 60,
		run_end = 100,
		punch_start = 120,
		punch_end = 150,
	}
})
