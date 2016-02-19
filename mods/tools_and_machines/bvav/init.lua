--try to mimic node collision boxes by creating multiple entities attached in an entity with no collision box

bvav_settings = {}
bvav_settings.attach_scaling = 30
bvav_settings.scaling = 0.667

bvav_settings.node_table = {"default:wood","default:tree","default:glass"}


minetest.register_entity("bvav:bvav_element", {
	initial_properties = {
		physical = true,
		collide_with_objects = true,
		collisionbox = {-0.5,-0.5,-0.5, 0.5,0.5,0.5},
		visual = "wielditem",
		textures = {},
		automatic_face_movement_dir = 0.0,
	},

	node = {},

	set_node = function(self, node)
		self.node = node
		local prop = {
			is_visible = true,
			textures = {node.name},
		}
		self.object:set_properties(prop)
	end,

	get_staticdata = function(self)
		return self.node.name
	end,

	on_activate = function(self, staticdata)
		self.object:set_armor_groups({immortal=1})
		if staticdata then
			self:set_node({name=staticdata})
		end
		minetest.after(0,function()
			if self.parent ~= nil and self.relative ~= nil then 
				self.object:set_attach(self.parent, "", {x=self.relative.x,y=self.relative.y,z=self.relative.z}, {x=0,y=0,z=0})
				self.object:set_properties({visual_size = {x=bvav_settings.scaling*3, y=bvav_settings.scaling*3}})
			else
				--this fixes issues with scaling
				self.object:set_properties({visual_size = {x=bvav_settings.scaling, y=bvav_settings.scaling}})
			end
		end)
	end,

	-- maybe have cannons, anchors, trolling lines, etc
	on_step = function(self, dtime)
		if self.parent ~= nil then
			
		else
			--self.object:setvelocity({x=math.random(-1,1)*math.random(),y=0,z=math.random(-1,1)*math.random()})
			--let player control vessel
			if self.controller then
				local vel = minetest.get_player_by_name(self.controller):get_look_dir()
				vel.x = vel.x * 2
				vel.y = vel.y * 2
				vel.z = vel.z * 2
				self.object:setvelocity(vel)
			end
			
		end
	end,
	--
})


function spawn_bvav_element(p, node)
	local obj = core.add_entity(p, "bvav:bvav_element")
	obj:get_luaentity():set_node(node)
	return obj
end
--[[
minetest.register_chatcommand("bvav", {
	params = "",
	description = "Send text to chat",
	func = function(name)
		pos = minetest.get_player_by_name(name):getpos()
		local parent = spawn_bvav_element(pos, {name="default:wood"})
		local basepos = parent:getpos()
		
		pos.y = pos.y + 1
		local child  = spawn_bvav_element(pos, {name="default:wood"})
		child:get_luaentity().parent = parent
		child:get_luaentity().relative = {x=(basepos.x - pos.x) * bvav_settings.attach_scaling,y=(basepos.y - pos.y) * bvav_settings.attach_scaling,z= (basepos.z - pos.z) * bvav_settings.attach_scaling}
			
	end,
})
]]--
function bvav_create_vessel(pos)

	local parent = spawn_bvav_element(pos, {name="bvav:control_node"})
	local basepos = parent:getpos()

	local range = 2
	
	
	
	local min = {x=pos.x-range,y=pos.y-range,z=pos.z-range}
	local max = {x=pos.x+range,y=pos.y+range,z=pos.z+range}
	local vm = minetest.get_voxel_manip()   
	local emin, emax = vm:read_from_map(min,max)
	local area = VoxelArea:new{MinEdge=emin, MaxEdge=emax}
	local data = vm:get_data()
	
	local air = minetest.get_content_id("air")

	--build the vessel
	for x = range*-1,range do
		for y = range*-1,range do
			for z = range*-1,range do
				local pos = {x=basepos.x+x,y=basepos.y+y,z=basepos.z+z}
				--entities for the vessel
				local node = vm:get_node_at(pos).name
				print(dump(node))
				if node ~= "air" then
					local child = spawn_bvav_element(pos, {name=node})
					child:get_luaentity().parent = parent
					child:get_luaentity().relative = {x=x * bvav_settings.attach_scaling,y=y * bvav_settings.attach_scaling,z=z * bvav_settings.attach_scaling}
				end
								
				--delete the nodes added to the vessel
				local p_pos = area:index(pos.x, pos.y, pos.z)
				data[p_pos] = air
				
			end
		end
	end
	vm:set_data(data)
	vm:calc_lighting()
	vm:write_to_map()
	vm:update_map()
	
	return(parent)
end


minetest.register_node("bvav:control_node", {
	description = "Control Node",
	tiles = {"default_stone.png"},
	groups = {cracky=3, stone=1},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		local vessel = bvav_create_vessel(pos)
		player:set_attach(vessel, "", {x=0,y=0,z=0}, {x=0,y=0,z=0})
		vessel:get_luaentity().controller = player:get_player_name()
	end,
})
