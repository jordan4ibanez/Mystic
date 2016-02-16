
minetest.register_node("portalgun:testblock", {
	description = "Test block",
	tiles = {"portalgun_testblock.png"},
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("portalgun:apb", {
	description = "Anti portal block",
	tiles = {"default_stone_brick.png^[colorize:#ffffffaa"},
	groups = {cracky = 3,not_in_creative_inventory=0},
	paramtype = "light",
	sounds = default.node_sound_stone_defaults(),
})



minetest.register_on_respawnplayer(function(player)
	local name=player:get_player_name()
	if portalgun.checkpoints[name]~=nil then
		minetest.after(0.2, function(name)
		player:moveto(portalgun.checkpoints[name])
		end, name)
	end
end)
minetest.register_on_leaveplayer(function(player)
	local name=player:get_player_name()
	if portalgun.checkpoints[name]~=nil then
		portalgun.checkpoints[name]=nil
	end
end)
minetest.register_node("portalgun:autocheckpoint", {
	description = "Checkpoint (teleports to here on death)",
	tiles = {"default_stone_brick.png^[colorize:#ffff00aa"},
	groups = {cracky = 3,not_in_creative_inventory=0},
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 5,
	sounds = default.node_sound_stone_defaults(),
	drawtype="nodebox",
	node_box = {
	type="fixed",
	fixed={-0.5,-0.5,-0.5,0.5,-0.4,0.5}},
	on_construct = function(pos)
		minetest.get_meta(pos):set_string("infotext","Checkpoint")
		minetest.env:get_node_timer(pos):start(2)
	end,
	on_timer = function (pos, elapsed)
		for i, ob in pairs(minetest.get_objects_inside_radius(pos, 1.5)) do
			if ob:is_player() then
				local name=ob:get_player_name()
				if portalgun.checkpoints[name]~=nil then
					local cp=portalgun.checkpoints[name]
					if cp.x==pos.x and cp.y==pos.y and cp.z==pos.z then
						return true
					end
				end
				portal_delete(name,0)
				portalgun_portal[name]=nil
				portalgun.checkpoints[name]=pos
				minetest.sound_play("portalgun_checkpoint", {pos=pos,max_hear_distance = 2, gain = 1})
				minetest.chat_send_player(name, "<Portalgun> You will spawn here next time you die")
			end
		end
		return true
	end,
})

minetest.register_node("portalgun:powerdoor1_1", {
	description = "Power door",
	inventory_image = "portalgun_powerwall.png",
	wield_image = "portalgun_powerwall.png",
	groups = {mesecon=1,unbreakable = 1,not_in_creative_inventory=0},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_stone_defaults(),
	drawtype="nodebox",
	alpha = 160,
	node_box = {
	type="fixed",
	fixed={-0.5,-0.5,0.4,0.5,0.5,0.5}},
	tiles = {
		{
			name = "portalgun_powerwall1.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.2,
			},
		},
	},
after_place_node = function(pos, placer, itemstack)
		local name=placer:get_player_name()
		minetest.get_meta(pos):set_string("owner",name)
		local p2=minetest.get_node(pos)
		pos.y=pos.y+1
		local n=minetest.get_node(pos)
		if n.name=="air" then
			minetest.set_node(pos,{name="portalgun:powerdoor1_2",param2=p2.param2})
			minetest.get_meta(pos):set_string("owner",name)
		end
	end,
on_punch = function(pos, node, player, pointed_thing)
		local meta = minetest.get_meta(pos);
		if meta:get_string("owner")==player:get_player_name() then
			minetest.node_dig(pos,minetest.get_node(pos),player)
			pos.y=pos.y+1
			local un=minetest.get_node(pos).name
			if un=="portalgun:powerdoor1_2" then
				minetest.set_node(pos,{name="air"})
			end
			pos.y=pos.y-1
			return true
		end
	end,
	mesecons = {effector = {
		action_on = function (pos, node)
			local owner=minetest.get_meta(pos):get_string("owner")
			minetest.set_node(pos,{name="portalgun:powerdoor2_1",param2=minetest.get_node(pos).param2})
			minetest.get_meta(pos):set_string("owner",owner)
			mesecon.receptor_on(pos)
			minetest.after(0.2, function(pos)
				pos.y=pos.y+1
				if minetest.get_node(pos).name=="portalgun:powerdoor1_2" then
					minetest.set_node(pos,{name="portalgun:powerdoor2_2",param2=minetest.get_node(pos).param2})
					minetest.get_meta(pos):set_string("owner",owner)
				end
			pos.y=pos.y-1
			end, pos)
		end,
	}}


})

minetest.register_node("portalgun:powerdoor1_2", {
	description = "Power door",
	inventory_image = "portalgun_powerwall.png",
	groups = {mesecon=1,unbreakable = 1,not_in_creative_inventory=1},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_stone_defaults(),
	drawtype="nodebox",
	alpha = 160,
	node_box = {
	type="fixed",
	fixed={-0.5,-0.5,0.4,0.5,0.5,0.5}},
	tiles = {
		{
			name = "portalgun_powerwall1.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.2,
			},
		},
	},
on_punch = function(pos, node, player, pointed_thing)
		local meta = minetest.get_meta(pos);
		if meta:get_string("owner")==player:get_player_name() then
			minetest.set_node(pos,{name="air"})
			pos.y=pos.y-1
			local un=minetest.get_node(pos).name
			if un=="portalgun:powerdoor1_1" then
				minetest.node_dig(pos,minetest.get_node(pos),player)
			end
			pos.y=pos.y+1
			return true
		end
	end,
	mesecons = {effector = {
		action_on = function (pos, node)
			local owner=minetest.get_meta(pos):get_string("owner")
			minetest.set_node(pos,{name="portalgun:powerdoor2_2",param2=minetest.get_node(pos).param2})
			minetest.get_meta(pos):set_string("owner",owner)
			mesecon.receptor_on(pos)
			pos.y=pos.y+1
			local mes=minetest.get_node_group(minetest.get_node(pos).name, "portalgun_powerdoor")
			if mes==1 then
				mesecon.receptor_on(pos)
			end
			pos.y=pos.y-1
		end,
	}}
})

minetest.register_node("portalgun:powerdoor2_1", {
	description = "Power door",
	inventory_image = "portalgun_powerwall.png",
	groups = {unbreakable=1,mesecon=1,not_in_creative_inventory=1},
	paramtype = "light",
	sunlight_propagates = true,
	drawtype="airlike",
	walkable = false,
	pointable = false,
	diggable = false,
	mesecons = {effector = {
		action_off = function (pos, node)
			local owner=minetest.get_meta(pos):get_string("owner")
			minetest.set_node(pos,{name="portalgun:powerdoor1_1",param2=minetest.get_node(pos).param2})
			minetest.get_meta(pos):set_string("owner",owner)
			mesecon.receptor_off(pos)
			minetest.after(0.2, function(pos)
				pos.y=pos.y+1
				if minetest.get_node(pos).name=="portalgun:powerdoor2_2" then
					minetest.set_node(pos,{name="portalgun:powerdoor1_2",param2=minetest.get_node(pos).param2})
					minetest.get_meta(pos):set_string("owner",owner)
				end
			pos.y=pos.y-1
			end, pos)
		end,
	}}
})

minetest.register_node("portalgun:powerdoor2_2", {
	description = "Power door",
	inventory_image = "portalgun_powerwall.png",
	groups = {unbreakable=1,mesecon=1,not_in_creative_inventory=1},
	paramtype = "light",
	sunlight_propagates = true,
	drawtype="airlike",
	walkable = false,
	pointable = false,
	diggable = false,
	mesecons = {effector = {
		action_off = function (pos, node)
			local owner=minetest.get_meta(pos):get_string("owner")
			minetest.set_node(pos,{name="portalgun:powerdoor1_2",param2=minetest.get_node(pos).param2})
			minetest.get_meta(pos):set_string("owner",owner)
			mesecon.receptor_off(pos)
		end,
	}}
})