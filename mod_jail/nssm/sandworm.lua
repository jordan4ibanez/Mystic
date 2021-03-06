nssm:spawn_specific("nssm:sandworm", {"default:desert_sand", "default:desert_stone"}, {"default:sand"}, 0, 20, 20, 5000, 1, -31000, 31000)
nssm:register_mob("nssm:sandworm", {
	type = "monster",
	hp_max = 30,
	hp_min = 25,
	collisionbox = {-0.6, -0.2, -0.6, 0.6, 1.90, 0.6},
	visual = "mesh",
	mesh = "sandworm.x",
	textures = {{"sandworm.png"}},
	visual_size = {x=10, y=10},
	makes_footstep_sound = false,
	view_range = 17,
	rotate = 270,
	worm = true,
	walk_velocity = 2,
	run_velocity = 2,
	damage = 4,
	jump = false,
	drops = {
        {name = "nssm:worm_flesh",
		chance = 2,
		min = 1,
		max = 3,},
		{name = "nssm:life_energy",
		chance = 1,
		min = 2,
		max = 3,},
	},
	armor = 90,
	drawtype = "front",
	water_damage = 5,
	lava_damage = 10,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogfight",
	animation = {
		speed_normal = 25,
		speed_run = 40,
		stand_start = 1,
		stand_end = 30,
		walk_start = 30,
		walk_end = 70,
		run_start = 30,
		run_end = 70,
		punch_start = 70,
		punch_end = 90,
	}
})
