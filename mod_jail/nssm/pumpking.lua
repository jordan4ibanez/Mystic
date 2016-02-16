nssm:spawn_specific("nssm:pumpking", {"default:dirt_with_grass", "default:dirt_with_snow","default:snowblock"}, {"default:pine_needles", "default:pine_tree"}, 0, 12, 120, 10000, 1, -31000, 31000)
nssm:register_mob("nssm:pumpking", {
	type = "monster",
	hp_max = 100,
	hp_min = 100,
	collisionbox = {-0.4, 0.00, -0.4, 0.4, 3.2, 0.4},
	visual = "mesh",
	mesh = "pumpking.x",
	textures = {{"pumpking.png"}},
	visual_size = {x=2.5, y=2.5},
	makes_footstep_sound = true,
	lifetimer=500,
	rotate=270,
	view_range = 35,
	walk_velocity = 2,
	run_velocity = 4,
    sounds = {
		random = "king",
		explode = "tnt_explode",
	},
	damage = 9,
	jump = true,
	drops = {
		{name = "nssm:life_energy",
		chance = 1,
		min = 7,
		max = 9,},
	},
	armor =50,
	drawtype = "front",
	water_damage = 2,
	lava_damage = 5,
	light_damage = 0,
	pump_putter = true,
	on_rightclick = nil,
	attack_type = "dogfight",
	animation = {
		stand_start = 165,		stand_end = 210,
		walk_start = 220,		walk_end = 260,
		run_start = 220,		run_end = 260,
		punch_start = 1,		punch_end = 30,
		punch1_start = 270,	punch1_end = 295,
		speed_normal = 15,		speed_run = 15,
	},
	on_die=function(self,pos)
		nssm:explosion(pos, 3, 0, 1, self.sounds.explode)
	end
})
