 
--
-- Minimal Development Test
-- Mod: test
--

-- Try out PseudoRandom
pseudo = PseudoRandom(13)
assert(pseudo:next() == 22290)
assert(pseudo:next() == 13854)
print('sdsdc')
local counter =  {}
minetest.register_on_joinplayer(function(player)
	
	print('ciao')
	local borsa = {}
	--print(tostring(minetest.registered_nodes['default:stone']))
	print(tostring('11111111111111111111111111111111111111111111111111111111111111111'))
	for i,v in pairs(minetest.registered_nodes)do
		print(tostring(i))
		borsa[i] = 1
	end
	print(tostring('222222222222222222222222222222222222222222222222222222222222222222'))

	print(tostring('333333333333333333333333333333333333333333333333333333333333333333'))
	for i,v in pairs(minetest.registered_craftitems)do
		print(tostring(i))
		local recipes = minetest.get_craft_recipe(i)
		
		print(recipes.items)
		if recipes.items then
			for ii,vv in pairs(recipes.items)do
				print(tostring(ii))
				if not borsa[vv] then borsa[vv] = 1 end
				borsa[vv]= borsa[vv] + 1
				print(tostring(vv))
				print('--')
			end
		end
		
		
	end
	print(dump(borsa))
	for i,v in pairs(borsa) do
		local title= (ItemStack(i):get_definition())
		print(dump(title.groups))
		for ii,vv in pairs(title.groups) do
			
			if borsa[ii]then
				borsa[i] = borsa[i] + borsa[ii]
			end
		end
			
	end
	for i,v in pairs(minetest.registered_items)do
		borsa[i] = 1
		print(tostring(i))
		local recipes = minetest.get_craft_recipe(i)
		
		print(recipes.items)
		if recipes.items then
			for ii,vv in pairs(recipes.items)do
				print(tostring(ii))
				if not borsa[vv] then borsa[vv] = 1 end
				borsa[vv]= borsa[vv] + 1
				print(tostring(vv))
				print('--')
				
			end
		end
		
		print(tostring(i))
	end
	for i,v in pairs(minetest.registered_items)do
		borsa[i] = 1
		print(tostring(i))
		local recipes = minetest.get_craft_recipe(i)
		counter[i] = 1
		print(recipes.items)
		if recipes.items then
			for ii,vv in pairs(recipes.items)do
				print(tostring(ii))
				if not borsa[vv] then borsa[vv] = 1 end
				borsa[i]=borsa[i] + borsa[vv] 
				print(tostring(vv))
				print('--')
				
			end
		end
		
		print(tostring(i))
	end
    
	print(dump(borsa))
function spairs(t, order)
    -- collect the keys
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end

    -- if order function given, sort by it by passing the table and keys a, b,
    -- otherwise just sort the keys 
    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end

    -- return the iterator function
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end
for k,v in spairs(borsa, function(t,a,b) return t[b] < t[a] end) do
    print(k,v)
end
	print(tostring('444444444444444444444444444444444444444444444444444444444444444444'))
	print(dump(minetest.registered_ores))
    
    for i,v in pairs(minetest.registered_ores) do
        local value = v.clust_scarcity * v.clust_size * (v.clust_num_ores or 1) * math.abs(v.y_max-v.y_min)
        print(v.ore .. ' ' .. value)
        
    end
    for i,v in pairs(core.registered_items) do
        print(i)
        local itemstack=ItemStack(i)
        print(itemstack)
        itemdef=itemstack:get_definition()
        itemcaps=itemdef.tool_capabilities
        print(dump(itemcaps))   
    end
	--print(dump(minetest.registered_craft))
	
end)

minetest.register_on_craft(function(itemstack, player, old_craft_grid, craft_inv)
	print(tostring(itemstack:get_name()))
	counter[itemstack:get_name()] = counter[itemstack:get_name()] + 1 
	print(tostring(counter[itemstack:get_name()]))
	print(dump(old_craft_grid))
	for i,v in pairs(old_craft_grid) do
		print(tostring(v:get_name()))
		counter[v:get_definition()] = counter[v:get_name()] - 1
	end
end)




