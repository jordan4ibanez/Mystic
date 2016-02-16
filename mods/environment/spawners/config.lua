-- * [name : string] - Name of the mob used in the mod.

-- [egg_name_custom : string] - Custom name for the egg item. If empty default name will be used i.e. 'mobs:chicken'.

-- * [dummy_size : table] - Size of the rotating dummy inside the node.

-- * [dummy_offset : integer] - Offset on Y axis of the dummy inside the node.

-- * [dummy_mesh : string] - Filename of the model used fot he mob.

-- * [dummy_texture : table] - Textures used for the mob.

-- * [night_only : string] - If true mobs will spawn only during the night or in dark areas, default:true.

-- [sound_custom : string] - Custom name for the sound file name if differ from default: i.e 'mobs_cow'.

-- [*] -> MANDATORY - has to be filled in!

-- mods what should be enabled and loded, remove/add the one you want to load
ENABLED_MODS = {"mobs", "pyramids", "creatures"}

-- mobs properties - setup all you mobs here
MOBS_PROPS = {
	["mobs"] = { -- MOBS REDO CONFIG
		{
			name="sheep_white",
			egg_name_custom="",
			dummy_size={x=0.52,y=0.52},
			dummy_offset=0.2,
			dummy_mesh="mobs_sheep.b3d",
			dummy_texture={"mobs_sheep_white.png"},
			night_only=false,
			sound_custom="mobs_sheep"
		},
		{
			name="cow",
			egg_name_custom="",
			dummy_size={x=0.3,y=0.3},
			dummy_offset=-0.3,
			dummy_mesh="mobs_cow.x",
			dummy_texture={"mobs_cow.png"},
			night_only=false,
			sound_custom=""
		},
		{
			name="chicken",
			egg_name_custom="",
			dummy_size={x=0.9,y=0.9},
			dummy_offset=0.2,
			dummy_mesh="mobs_chicken.x",
			dummy_texture={"mobs_chicken.png", "mobs_chicken.png", "mobs_chicken.png", "mobs_chicken.png", "mobs_chicken.png", "mobs_chicken.png", "mobs_chicken.png", "mobs_chicken.png", "mobs_chicken.png"},
			night_only=false,
			sound_custom=""
		},
		{
			name="pumba",
			egg_name_custom="",
			dummy_size={x=0.62,y=0.62},
			dummy_offset=-0.3,
			dummy_mesh="mobs_pumba.x",
			dummy_texture={"mobs_pumba.png"},
			night_only=false,
			sound_custom="mobs_pig"
		},
		{
			name="bunny",
			egg_name_custom="",
			dummy_size={x=1,y=1},
			dummy_offset=0.2,
			dummy_mesh="mobs_bunny.b3d",
			dummy_texture={"mobs_bunny_brown.png"},
			night_only=false,
			sound_custom="spawners_bunny"
		},
		{
			name="kitten",
			egg_name_custom="",
			dummy_size={x=0.32,y=0.32},
			dummy_offset=0,
			dummy_mesh="mobs_kitten.b3d",
			dummy_texture={"mobs_kitten_ginger.png"},
			night_only=false,
			sound_custom=""
		}
	},

	["pyramids"] = { -- PYRAMIDS MOD CONFIG
		{
			name="mummy",
			egg_name_custom="pyramids:spawn_egg",
			dummy_size={x=3.3,y=3.3},
			dummy_offset=-0.3,
			dummy_mesh="pyramids_mummy.x",
			dummy_texture={"pyramids_mummy.png"},
			night_only=false,
			sound_custom="mummy"
		}
	},


	["creatures"] = { -- CREATURES MOD CONFIG
		{
			name="chicken",
			egg_name_custom="creatures:chicken_spawn_egg",
			dummy_size={x=0.9,y=0.9},
			dummy_offset=-0.3,
			dummy_mesh="creatures_chicken.b3d",
			dummy_texture={"creatures_chicken.png"},
			night_only=false,
			sound_custom=""
		},	
		{
			name="ghost",
			egg_name_custom="creatures:ghost_spawn_egg",
			dummy_size={x=0.7,y=0.7},
			dummy_offset=-0.5,
			dummy_mesh="creatures_ghost.b3d",
			dummy_texture={"creatures_ghost.png"},
			night_only=true,
			sound_custom=""
		},	
		{
			name="sheep",
			egg_name_custom="creatures:sheep_spawn_egg",
			dummy_size={x=0.6,y=0.6},
			dummy_offset=-0.3,
			dummy_mesh="creatures_sheep.b3d",
			dummy_texture={"creatures_sheep.png^creatures_sheep_white.png"},
			night_only=false,
			sound_custom=""
		},	
		{
			name="zombie",
			egg_name_custom="creatures:zombie_spawn_egg",
			dummy_size={x=0.5,y=0.5},
			dummy_offset=-0.5,
			dummy_mesh="creatures_zombie.b3d",
			dummy_texture={"creatures_zombie.png"},
			night_only=true,
			sound_custom=""
		}	
	}

}