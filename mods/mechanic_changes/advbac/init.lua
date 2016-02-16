--config--
local speedc = 3 -- Speed of the cells
----------



--------------------------craft------------------------------

minetest.register_craft({         --Simple cell craft
	output = "advbac:cell 3",
	recipe = {
		{"default:dirt", "default:stone", "default:dirt"},
		{"default:stone", "default:steelblock", "default:stone"},
		{"default:dirt", "default:stone", "default:dirt"}
	}
})

minetest.register_craft({         --Red cell craft
	output = "advbac:cell3",
	recipe = {
		{"advbac:cell", "advbac:cell2", "advbac:cell"},
		{"advbac:cell2", "default:steelblock", "advbac:cell2"},
		{"advbac:cell", "advbac:cell2", "advbac:cell"}
	}
})



-------------------------Simple cell-----------------------------------

minetest.register_node("advbac:cell", {    --Register The cell Block
	description = "Simple cell",
	tiles = {"cell.png"},
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=0},
})


minetest.register_abm({                  --Cell Movement     
	nodenames = {"advbac:cell"},
	interval = speedc,
	chance = 1,
	action = function(pos)
	 if minetest.find_node_near({x=pos.x+2, y=pos.y, z=pos.z}, 1, {"advbac:cell"}) and      --  2 Cell rotate x to z and the cell of the center is alive    
	 minetest.find_node_near({x=pos.x-2, y=pos.y, z=pos.z}, 1, {"advbac:cell"}) and
	 not minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z}, 1, {"default:glass"})
	 then
	 minetest.remove_node({x=pos.x+1, y=pos.y, z=pos.z})                                
	 minetest.remove_node({x=pos.x-1, y=pos.y, z=pos.z})
	 minetest.remove_node({x=pos.x, y=pos.y, z=pos.z})
	 minetest.add_node({x=pos.x, y=pos.y, z=pos.z+1}, {name="advbac:cell"})
	 minetest.add_node({x=pos.x, y=pos.y, z=pos.z-1}, {name="advbac:cell"})
	 minetest.add_node({x=pos.x, y=pos.y, z=pos.z}, {name="advbac:cell"})
	 

	 elseif minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z+2}, 1, {"advbac:cell"}) and  -- 2 Cell rotate z to x and the cell of the center is alive
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z-2}, 1, {"advbac:cell"}) and
	 not minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z}, 1, {"default:glass"})
	 then
	 minetest.remove_node({x=pos.x, y=pos.y, z=pos.z+1})
	 minetest.remove_node({x=pos.x, y=pos.y, z=pos.z-1})
	 minetest.remove_node({x=pos.x, y=pos.y, z=pos.z})
	 minetest.add_node({x=pos.x-1, y=pos.y, z=pos.z}, {name="advbac:cell"})
	 minetest.add_node({x=pos.x+1, y=pos.y, z=pos.z}, {name="advbac:cell"})
	 minetest.add_node({x=pos.x, y=pos.y, z=pos.z}, {name="advbac:cell"})
	
	
	 end
	 
	end,
})


minetest.register_abm({                  -- Kill the alone cells
	nodenames = {"advbac:cell"},
	interval = speedc,
	chance = 1,
	action = function(pos)
	 if 
	 not minetest.find_node_near({x=pos.x+2, y=pos.y, z=pos.z}, 1, {"advbac:cell"}) and  
	 not minetest.find_node_near({x=pos.x-2, y=pos.y, z=pos.z}, 1, {"advbac:cell"}) and
	 not minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z+2}, 1, {"advbac:cell"}) and 
	 not minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z-2}, 1, {"advbac:cell"})
	 then
	 minetest.remove_node({x=pos.x, y=pos.y, z=pos.z})
	 end
	end,
})

minetest.register_abm({                  -- Kill the cells who have 4 neighbour
	nodenames = {"advbac:cell"},
	interval = speedc,
	chance = 1,
	action = function(pos)
	 if 
	 minetest.find_node_near({x=pos.x+2, y=pos.y, z=pos.z}, 1, {"advbac:cell"}) and 
	 minetest.find_node_near({x=pos.x-2, y=pos.y, z=pos.z}, 1, {"advbac:cell"}) and
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z+2}, 1, {"advbac:cell"}) and 
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z-2}, 1, {"advbac:cell"})
	 then
	 minetest.remove_node({x=pos.x, y=pos.y, z=pos.z})
	 end
	end,
})

minetest.register_abm({                  -- cell mutation to cell2 manually with 4 neighbour
	nodenames = {"advbac:cell2"},
	interval = speedc,
	chance = 1,
	action = function(pos)
	 if 
	 minetest.find_node_near({x=pos.x+2, y=pos.y, z=pos.z}, 1, {"advbac:cell"}) and 
	 minetest.find_node_near({x=pos.x-2, y=pos.y, z=pos.z}, 1, {"advbac:cell"}) and
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z+2}, 1, {"advbac:cell"}) and 
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z-2}, 1, {"advbac:cell"})
	 then
	  minetest.add_node({x=pos.x, y=pos.y, z=pos.z}, {name="advbac:cell"})
	 end
	end,
})



-----------------------------Blue cell---------------------------------



minetest.register_node("advbac:cell2", {    --Register The cell2 Block
	
	tiles = {"cell2.png"},
	description = "Blue cell",
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=0},
})


minetest.register_abm({                  --Cell2 Movement     
	nodenames = {"advbac:cell2"},
	interval = speedc,
	chance = 1,
	action = function(pos)
	 if minetest.find_node_near({x=pos.x+2, y=pos.y, z=pos.z}, 1, {"advbac:cell2"}) and      --  2 Cell rotate x to z and the cell of the center is alive    
	 minetest.find_node_near({x=pos.x-2, y=pos.y, z=pos.z}, 1, {"advbac:cell2"}) and
	 not minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z}, 1, {"default:glass"})
	 then
	 minetest.remove_node({x=pos.x+1, y=pos.y, z=pos.z})                                
	 minetest.remove_node({x=pos.x-1, y=pos.y, z=pos.z})
	 minetest.remove_node({x=pos.x, y=pos.y, z=pos.z})
	 minetest.add_node({x=pos.x, y=pos.y, z=pos.z+1}, {name="advbac:cell2"})
	 minetest.add_node({x=pos.x, y=pos.y, z=pos.z-1}, {name="advbac:cell2"})
	 minetest.add_node({x=pos.x, y=pos.y, z=pos.z}, {name="advbac:cell2"})
	 

	 elseif minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z+2}, 1, {"advbac:cell2"}) and  -- 2 Cell rotate z to x and the cell of the center is alive
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z-2}, 1, {"advbac:cell2"}) and
	 not minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z}, 1, {"default:glass"})
	 then
	 minetest.remove_node({x=pos.x, y=pos.y, z=pos.z+1})
	 minetest.remove_node({x=pos.x, y=pos.y, z=pos.z-1})
	 minetest.remove_node({x=pos.x, y=pos.y, z=pos.z})
	 minetest.add_node({x=pos.x-1, y=pos.y, z=pos.z}, {name="advbac:cell2"})
	 minetest.add_node({x=pos.x+1, y=pos.y, z=pos.z}, {name="advbac:cell2"})
	 minetest.add_node({x=pos.x, y=pos.y, z=pos.z}, {name="advbac:cell2"})
	
	
	 end
	 
	end,
})


minetest.register_abm({                  -- Kill the alone cells2
	nodenames = {"advbac:cell2"},
	interval = speedc,
	chance = 1,
	action = function(pos)
	 if 
	 not minetest.find_node_near({x=pos.x+2, y=pos.y, z=pos.z}, 1, {"advbac:cell2"}) and  
	 not minetest.find_node_near({x=pos.x-2, y=pos.y, z=pos.z}, 1, {"advbac:cell2"}) and
	 not minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z+2}, 1, {"advbac:cell2"}) and 
	 not minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z-2}, 1, {"advbac:cell2"})
	 then
	 minetest.remove_node({x=pos.x, y=pos.y, z=pos.z})
	 end
	end,
})

minetest.register_abm({                  -- Kill the cells2 who have 4 neighbour
	nodenames = {"advbac:cell2"},
	interval = speedc,
	chance = 1,
	action = function(pos)
	 if 
	 minetest.find_node_near({x=pos.x+2, y=pos.y, z=pos.z}, 1, {"advbac:cell2"}) and 
	 minetest.find_node_near({x=pos.x-2, y=pos.y, z=pos.z}, 1, {"advbac:cell2"}) and
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z+2}, 1, {"advbac:cell2"}) and 
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z-2}, 1, {"advbac:cell2"})
	 then
	 minetest.remove_node({x=pos.x, y=pos.y, z=pos.z})
	 end
	end,
})






---------------------------Red Cell-------------------------------------



minetest.register_node("advbac:cell3", {    --Register The cell3 Block
	
	tiles = {"cell3.png"},
	description = "Red cell",
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=0},
})


minetest.register_abm({                  --Cell3 Movement     
	nodenames = {"advbac:cell3"},
	interval = speedc,
	chance = 1,
	action = function(pos)
	 if minetest.find_node_near({x=pos.x+2, y=pos.y, z=pos.z}, 1, {"advbac:cell3"}) and      --  2 Cell rotate x to z and the cell of the center is alive    
	 minetest.find_node_near({x=pos.x-2, y=pos.y, z=pos.z}, 1, {"advbac:cell3"}) and
	 not minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z}, 1, {"default:glass"})
	 then
	 minetest.remove_node({x=pos.x+1, y=pos.y, z=pos.z})                                
	 minetest.remove_node({x=pos.x-1, y=pos.y, z=pos.z})
	 minetest.remove_node({x=pos.x, y=pos.y, z=pos.z})
	 minetest.add_node({x=pos.x, y=pos.y, z=pos.z+1}, {name="advbac:cell3"})
	 minetest.add_node({x=pos.x, y=pos.y, z=pos.z-1}, {name="advbac:cell3"})
	 minetest.add_node({x=pos.x, y=pos.y, z=pos.z}, {name="advbac:cell3"})
	 

	 elseif minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z+2}, 1, {"advbac:cell3"}) and  -- 2 Cell rotate z to x and the cell of the center is alive
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z-2}, 1, {"advbac:cell3"}) and
	 not minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z}, 1, {"default:glass"})
	 then
	 minetest.remove_node({x=pos.x, y=pos.y, z=pos.z+1})
	 minetest.remove_node({x=pos.x, y=pos.y, z=pos.z-1})
	 minetest.remove_node({x=pos.x, y=pos.y, z=pos.z})
	 minetest.add_node({x=pos.x-1, y=pos.y, z=pos.z}, {name="advbac:cell3"})
	 minetest.add_node({x=pos.x+1, y=pos.y, z=pos.z}, {name="advbac:cell3"})
	 minetest.add_node({x=pos.x, y=pos.y, z=pos.z}, {name="advbac:cell3"})
	
	
	 end
	 
	end,
})


minetest.register_abm({                  -- Kill the alone cells3
	nodenames = {"advbac:cell3"},
	interval = speedc,
	chance = 1,
	action = function(pos)
	 if 
	 not minetest.find_node_near({x=pos.x+2, y=pos.y, z=pos.z}, 1, {"advbac:cell3"}) and  
	 not minetest.find_node_near({x=pos.x-2, y=pos.y, z=pos.z}, 1, {"advbac:cell3"}) and
	 not minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z+2}, 1, {"advbac:cell3"}) and 
	 not minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z-2}, 1, {"advbac:cell3"})
	 then
	 minetest.remove_node({x=pos.x, y=pos.y, z=pos.z})
	 end
	end,
})

minetest.register_abm({                  -- Kill the cells3 who have 4 cells2 neighbour
	nodenames = {"advbac:cell3"},
	interval = speedc,
	chance = 1,
	action = function(pos)
	 if 
	 minetest.find_node_near({x=pos.x+2, y=pos.y, z=pos.z}, 1, {"advbac:cell3"}) and 
	 minetest.find_node_near({x=pos.x-2, y=pos.y, z=pos.z}, 1, {"advbac:cell3"}) and
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z+2}, 1, {"advbac:cell3"}) and 
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z-2}, 1, {"advbac:cell3"})
	 then
	 minetest.remove_node({x=pos.x, y=pos.y, z=pos.z})
	 end
	end,
})

minetest.register_abm({                  -- cell mutation to cell3 manually with 4 neighbour
	nodenames = {"advbac:cell"},
	interval = speedc,
	chance = 1,
	action = function(pos)
	 if 
	 minetest.find_node_near({x=pos.x+2, y=pos.y, z=pos.z}, 1, {"advbac:cell3"}) and 
	 minetest.find_node_near({x=pos.x-2, y=pos.y, z=pos.z}, 1, {"advbac:cell3"}) and
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z+2}, 1, {"advbac:cell3"}) and 
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z-2}, 1, {"advbac:cell3"})
	 then
	  minetest.add_node({x=pos.x, y=pos.y, z=pos.z}, {name="advbac:cell3"})
	 end
	end,
})

minetest.register_abm({                  -- cell2 mutation to cell3 manually with 4 neighbour
	nodenames = {"advbac:cell2"},
	interval = speedc,
	chance = 1,
	action = function(pos)
	 if 
	 minetest.find_node_near({x=pos.x+2, y=pos.y, z=pos.z}, 1, {"advbac:cell3"}) and 
	 minetest.find_node_near({x=pos.x-2, y=pos.y, z=pos.z}, 1, {"advbac:cell3"}) and
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z+2}, 1, {"advbac:cell3"}) and 
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z-2}, 1, {"advbac:cell3"})
	 then
	  minetest.add_node({x=pos.x, y=pos.y, z=pos.z}, {name="advbac:cell3"})
	 end
	end,
})








-----------------------------------

minetest.register_abm({                  -- cell mutation to cell2
	nodenames = {"advbac:cell"},
	interval = speedc-1,
	chance = 1,
	action = function(pos)
	if 
	 minetest.find_node_near({x=pos.x+2, y=pos.y, z=pos.z}, 1, {"advbac:cell"}) and 
	 minetest.find_node_near({x=pos.x-2, y=pos.y, z=pos.z}, 1, {"advbac:cell"}) and
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z+2}, 1, {"advbac:cell"}) and 
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z-2}, 1, {"advbac:cell"})
	 
	 then
	 minetest.add_node({x=pos.x, y=pos.y, z=pos.z}, {name="advbac:cell2"})
	 end
	end,
	})
	
minetest.register_abm({                  -- cell mutation to coal
	nodenames = {"advbac:cell"},
	interval = speedc-1,
	chance = 1,
	action = function(pos)
	if 
	 minetest.find_node_near({x=pos.x+2, y=pos.y, z=pos.z}, 1, {"advbac:cell2"}) and 
	 minetest.find_node_near({x=pos.x-2, y=pos.y, z=pos.z}, 1, {"advbac:cell"}) and
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z+2}, 1, {"advbac:cell2"}) and 
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z-2}, 1, {"advbac:cell"}) or
	 
	 minetest.find_node_near({x=pos.x+2, y=pos.y, z=pos.z}, 1, {"advbac:cell"}) and 
	 minetest.find_node_near({x=pos.x-2, y=pos.y, z=pos.z}, 1, {"advbac:cell2"}) and
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z+2}, 1, {"advbac:cell"}) and 
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z-2}, 1, {"advbac:cell2"}) 
	 
	 
	 
	 then
	 minetest.add_node({x=pos.x, y=pos.y, z=pos.z}, {name="default:stone_with_coal"})
	 end
	end,
	})
	
minetest.register_abm({                  -- cell mutation to iron
	nodenames = {"advbac:cell"},
	interval = speedc-1,
	chance = 1,
	action = function(pos)
	if 
	 minetest.find_node_near({x=pos.x+2, y=pos.y, z=pos.z}, 1, {"advbac:cell2"}) and 
	 minetest.find_node_near({x=pos.x-2, y=pos.y, z=pos.z}, 1, {"advbac:cell2"}) and
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z+2}, 1, {"advbac:cell"}) and 
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z-2}, 1, {"advbac:cell"}) or
	 
	 minetest.find_node_near({x=pos.x+2, y=pos.y, z=pos.z}, 1, {"advbac:cell"}) and 
	 minetest.find_node_near({x=pos.x-2, y=pos.y, z=pos.z}, 1, {"advbac:cell"}) and
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z+2}, 1, {"advbac:cell2"}) and 
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z-2}, 1, {"advbac:cell2"}) 
	 
	 
	 
	 then
	 minetest.add_node({x=pos.x, y=pos.y, z=pos.z}, {name="default:stone_with_iron"})
	 end
	end,
	})

minetest.register_abm({                  -- cell mutation to diamond
	nodenames = {"advbac:cell"},
	interval = speedc-1,
	chance = 1,
	action = function(pos)
	if 
	 minetest.find_node_near({x=pos.x+2, y=pos.y, z=pos.z}, 1, {"advbac:cell2"}) and 
	 minetest.find_node_near({x=pos.x-2, y=pos.y, z=pos.z}, 1, {"advbac:cell2"}) and
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z+2}, 1, {"advbac:cell3"}) and 
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z-2}, 1, {"advbac:cell3"}) or
	 
	 minetest.find_node_near({x=pos.x+2, y=pos.y, z=pos.z}, 1, {"advbac:cell3"}) and 
	 minetest.find_node_near({x=pos.x-2, y=pos.y, z=pos.z}, 1, {"advbac:cell3"}) and
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z+2}, 1, {"advbac:cell2"}) and 
	 minetest.find_node_near({x=pos.x, y=pos.y, z=pos.z-2}, 1, {"advbac:cell2"}) 
	 
	 
	 
	 then
	 minetest.add_node({x=pos.x, y=pos.y, z=pos.z}, {name="default:stone_with_diamond"})
	 end
	end,
	})


