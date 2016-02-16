#Watering Can
* A mod for Minetest
* Version: 1.0

##Description
This mod adds a watering can to minetest which you can use to make some blocks wet. :-)

##Getting the watering can
You can get a watering can with the creative inventory or with the chat command

    `/giveme wateringcan:wateringcan_empty`

This chat commands requires you to have the `give` privilege.

There is no crafting recipe yet. There is one planned in the future.

##Usage
To use a watering can, you have to first fill it up. Rightclick with it on water.
Your watering can is now full. To use it, you have to rightclick on a node which can be made wet.
You can use the watering can 24 times, then you have to fill it up again.
The watering can uses the “tool wear” bar to indicate how much water is left. 
The watering can itself does *not* wear off and does not get destroyed by usage (it just becomes empty).

Currently, the watering can supports the Farming mod (from `minetest_game`) and the Pedology mod.
For the Farming mod, you can use the watering can on soil to wetten it.
For the Pedology mod, you can increase the wetness level of ground blocks by 1, but the maximum wetness you can reach is 2 to avoid creating mud lakes only with a watering can. ;-)

Anything else currently can’t become wet; you’d simply waste your water. ;-)

##Support
Currently, the mods Farming and Pedology are supported.

As for water, any node which is member of the `water` group can be used to fill up the watering can.

##Dependencies
There are only optional dependencies:

* `farming`
* `pedology`

However, it recommended to use at least one of these mods, otherwise you have nothing to use the watering can on. ;-)


