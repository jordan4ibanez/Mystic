nssm:spawn_specific("nssm:masticone", {"default:dirt_with_grass"}, {"default:tree"}, 0, 20, 120, 4000, 2, -31000, 22)
nssm:register_mob("nssm:masticone", {
	type = "monster",
	hp_max = 15,
	hp_min = 14,
	collisionbox = {-0.45, 0.00, -0.45, 0.45, 0.40, 0.45},
	visual = "mesh",
	mesh = "masticone.x",
	textures = {{"masticone.png"}},
	visual_size = {x=4, y=4},
	makes_footstep_sound = true,
	view_range = 15,
	lifetimer = 500,
	rotate = 270,
	walk_velocity = 1.5,
	run_velocity = 2.5,
  sounds = {
		random = "masticone",
	},
	damage = 5,
	jump = true,
	drops = {
		{name = "nssm:life_energy",
		chance = 1,
		min = 7,
		max = 8,},
		{name = "nssm:masticone_fang",
		chance = 1,
		min = 1,
		max = 2,},
		{name = "nssm:masticone_skull_fragments",
		chance = 2,
		min = 1,
		max = 2,},
	},
	armor = 60,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 5,
	hydra = true,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogfight",
	reach =1.5,
	animation = {
		speed_normal = 20,
		speed_run = 30,
		stand_start = 80,
		stand_end = 140,
		walk_start = 20,
		walk_end = 40,
		run_start = 20,
		run_end = 40,
		punch_start = 50,
		punch_end = 75,
	},
	on_die = function(self, pos)
			core.after(2, function()
				minetest.add_particlespawner(
					200, --amount
					0.1, --time
					{x=pos.x-1, y=pos.y-1, z=pos.z-1}, --minpos
					{x=pos.x+1, y=pos.y+1, z=pos.z+1}, --maxpos
					{x=-0, y=-0, z=-0}, --minvel
					{x=1, y=1, z=1}, --maxvel
					{x=-0.5,y=5,z=-0.5}, --minacc
					{x=0.5,y=5,z=0.5}, --maxacc
					0.1, --minexptime
					1, --maxexptime
					3, --minsize
					4, --maxsize
					false, --collisiondetection
					"tnt_smoke.png" --texture
				)
				local pos1 = {x=pos.x+math.random(-1,1), y=pos.y+0.5, z=pos.z+math.random(-1,1)}
				local pos2 = {x=pos.x+math.random(-1,1), y=pos.y+0.5, z=pos.z+math.random(-1,1)}
				minetest.add_entity(pos1, "nssm:masticone")
				minetest.add_entity(pos2, "nssm:masticone")
    end)
	end,
})
