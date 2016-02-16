-- user settings
dofile(minetest.get_modpath("spawners").."/config.lua")
-- API
dofile(minetest.get_modpath("spawners").."/API.lua")
-- Spawners for mobs
dofile(minetest.get_modpath("spawners").."/spawners_mobs.lua")
-- Spawners for ores
dofile(minetest.get_modpath("spawners").."/spawners_ores.lua")

print ("[MOD] Spawners 0.4 Loaded.")