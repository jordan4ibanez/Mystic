# Spawners #
This MOD for Minetest let the player craft mob Spawner blocks. Mobs are spawning randomly in a short intervals.

Easy to implement new mob mods just look in to config.lua.

Currently it works with [Pyramids Mummy](https://forum.minetest.net/viewtopic.php?id=7063), [Mobs Redo](https://forum.minetest.net/viewtopic.php?f=11&t=9917) and [Creatures](https://forum.minetest.net/viewtopic.php?f=11&t=8638).

![spawners_promo.jpg](https://bitbucket.org/repo/y69Me7/images/3793257566-spawners_promo.jpg)
![spawner_waiting_medium.gif](https://bitbucket.org/repo/y69Me7/images/246761582-spawner_waiting_medium.gif) ![spawner_animated_medium.gif](https://bitbucket.org/repo/y69Me7/images/1359872529-spawner_animated_medium.gif)

## YouTube video ##
[Minetest - spawners MOD v0.1](https://youtu.be/TlaMVl0ZDtw)

## Mod dependencies ##
* default
* fake_fire?
* xpanes?
* mobs?
* creatures?
* pyramids?

mobs redo, creatures are supported mods

fake_fire, xpanes for recipes

## Links ##
[Minetest Forum Page](https://forum.minetest.net/viewtopic.php?f=10&t=13727) - try this MOD on this server

[G+ Collection](https://plus.google.com/collection/06fEx)

[G+ Community](https://plus.google.com/communities/105201070842404099845)

## License ##
WTFPL

## Changelog ##
### 0.4 ###
* NEW added ore spawners - iron, gold and copper
* ore spawners have chance to spawn 2 ores from 1 ingot
* ore spawners have formspec
* new sounds for ore spawners
* added particle effect for ore spawners
* re-done all textures from scratch (mob and ore spawners)
* adjusted mob spawners ABM
* added maximum stacked items for spawners to max 1
* mob spawners fixed name conflicts in config file warthog vs. pumba

### 0.3 ###
* new folder and file structure
* more convenient disable/enable, add/remove new MODs in config.lua file - added property for custom sounds
* added sound for bunny
* fixed sound for pyramids:mummy
* added footsteps and dug sounds for the spawners
* shorter and more effective code, easier to read, fixed variable namings
* ABM tweak - longer delay to trigger but bigger chance for spawn entity
* disabled ABM catch_up
* added normal map texture for default spawner

### 0.2 ###
* support pyramids mod - mummy
* support creatures mod
* shorten the code - more effecient

### 0.1 ###
* Initial Release
* detects only 6 nodes for 'air' around the spawner [top, bottom, left, right, front, back] afterwards it will check the node above and below the found 'air' node - so there is enough space to spawn someone
* always picks random side from where the mob will spawn
* detects for light and time of day - spawn mobs only at night if 'only_night' set to true
* status 'waiting' - blue sparkles, for not enough light (day spawners) or too much light for night spawners
* status 'default/inactive' i.e. if the spawner is closed from each side or there is no space to spawn mob
* status 'active' when spawner is active and is spawning mobs
* status 'overheat' when there is too much 'max_objects_per_block' (prevents from server errors), max value is taken from minetest.conf
* easy to configure, add and remove MODs for mobs
* only [Mobs Redo](https://github.com/tenplus1/mobs) from tenplus1 is added for now
* added recipes for all spawners, it's expensive so it will not get overcrowded on the server only with spawners 
* almost everything is done dynamically
* spawners emit small amount of light
* active and overheated spawner can cause fire to flammable nodes around it
* spawners are active only if player is in radius (21)
* spawners are diggable only with steel pickaxe and above, so no noob griefers can raid your base too easy
* mobs play sound when spawned
* animated textures