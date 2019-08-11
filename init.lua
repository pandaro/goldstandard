goldstandard ={}

local exList={}
    exList.quadrato = 1
    
    exList.gianni = {
        9,
        8,
        7,
    }
    exList.cerchio=11
    exList.rosso={}
    exList.rosso.giallo={
            6,
            5
        }
    exList.rosso.blu={
            4,
            3
        }
    
    exList.triangolo=2
    

function goldstandard.oreValue()
    for i,v in pairs(minetest.registered_ores) do
        local value = v.clust_scarcity * v.clust_size * (v.clust_num_ores or 1) * math.abs(v.y_max-v.y_min)
        print(v.ore .. ' ' .. value)
    end
end

function goldstandard.digTimeValue()
    for item,v in pairs(minetest.registered_items) do
        local itemstack=ItemStack(item)
        local itemDef = itemstack:get_definition()
        --print(item .. ' ' ..(dump(itemDef.groups)))
        for nameGroup,tableValue in pairs (itemDef.groups) do
            print(type(tableValue))
            print(nameGroup .. ' ' ..tableValue)
            if type(tableValue) == 'table' then
                print(item .. ' ' ..nameGroup)
                
            end
        end
    end
end
    
-- function goldstandard.DeepPrint (e)
--     -- if e is a table, we should iterate over its elements
--     if type(e) == "table" then
--         for k,v in pairs(e) do -- for every element in the table
--             print(k)
--             goldstandard.DeepPrint(v)       -- recursively repeat the same procedure
--         end
--     else -- if not, we can just print it
--         print(e)
--     end
-- end
goldstandard.dppath='base '
goldstandard.dplist={}
goldstandard.dpindex=0
goldstandard.dpcurrent=''

-- function goldstandard.DeepPrint3 (e,name)
--     -- if e is a table, we should iterate over its elements
--     
--     if type(e) == "table" then
--         
--         table.insert(goldstandard.dplist,goldstandard.dpindex,name)
--         for i,v in pairs(goldstandard.dplist) do
--             goldstandard.dppath = goldstandard.dppath .. v
--         end
--         
--         
--         
--         for k,v in pairs(e) do -- for every element in the table
--             print(k)
--             goldstandard.DeepPrint3(v,k)       -- recursively repeat the same procedure
--         end
--     else -- if not, we can just print it
-- --         print(e)
--     print(goldstandard.dppath .. ' ' ..e)
--     end
-- end
-- 

--[[goldstandard.basetool={}
function goldstandard.toolanalisy(caps)
    for i,v in pairs(caps.groupcaps) do
        
       ]] 
goldstandard.new_t={}
function goldstandard.clone (t,target,name) 
    if not t then return end-- t is a table
    local i, v = next(t,nil)  -- i is an index of t, v = t[i]
    while i do
        if target[i] ~= nil and type(v) == 'number' then
--             print('added')
            
            if v > target[i] then
                target[i] =  v
            end
        elseif target[i] ~= nil and type(v) == 'table' then
            if target[i] == nil then
                target[i]={}
            end
            goldstandard.clone(v,target[i],i)
            
        else
            if target[i] == nil then
                target[i] = v 
            else
                if v > target[i] then
                    target[i] = v
                end
            end
        end
        
        i, v = next(t, i)        -- get next index
    end
end


-- goldstandard.aaa={}
-- goldstandard.bbb = ''
-- goldstandard.listlv={}
-- 
-- 
-- function goldstandard.deepPrint2 (e,index)
-- 
--     goldstandard.bbb = index
--     --print('deepPrint2 type '.. ' ' ..type( e))
--     if type(e) == "table" then
--         print(next(e))        
--         for k,v in pairs(e) do -- for every element in the table
--             print('index ' .. k)
--             
--             goldstandard.aaa[index]={}
--             table.insert(goldstandard.listlv,-1,k)
-- 
--                     
--                 
--             goldstandard.deepPrint2(v,k)       -- recursively repeat the same procedure
--         end
--     else 
--         --print(e)
--         --goldstandard.aaa[index] = e
--         --[[table.insert(goldstandard.aaa[-1],-1,e)]] 
--     end
-- end
-- 
-- goldstandard.average={}
-- 
-- 
-- function goldstandard.deepSearch (e)
-- 
--     local average = {}
--     -- if e is a table, we should iterate over its elements
--     if type(e) == "table" then
--         
--         
--         for k,v in pairs(e) do -- for every element in the table
-- 
--             if goldstandard.deepSearchCurrent ~= k then
--                 goldstandard.deepSearchCurrent = k
--                 
--             end
--                 
-- --             print(k)
--             if type(v) == 'table' then
--                 print(k)
--                 if not goldstandard.average[goldstandard.deepSearchCurrent] then
--                     goldstandard.average[goldstandard.deepSearchCurrent]={}
--                 end
--             else
--                 if not goldstandard.average[goldstandard.deepSearchCurrent] then
--                     goldstandard.average[goldstandard.deepSearchCurrent] = v
--                 end
--                 --print(k .. ' ' .. v)
--             end
--             goldstandard.tableDeep = goldstandard.tableDeep +1
--             
--             goldstandard.tablePath[goldstandard.tableDeep] = k
--             
--             goldstandard.deepSearch(self,v)       -- recursively repeat the same procedure
--         end
--     else -- if not, we can just print it
--         print('')
--         goldstandard.average[goldstandard.deepSearchCurrent] = e
--     end
--     print(dump(goldstandard.average)) --SISTEMA GLI INDICI NUMERO
-- end

function goldstandard.toolParse()
    
    local toolAverage = {}
    for i,v in pairs(core.registered_tools) do
        local itemStack=ItemStack(i)
        local itemDef=itemStack:get_definition()
        local itemCaps=itemDef.tool_capabilities
        --print(i.. ' ' .. dump(itemCaps))
        --print(type(dump(itemCaps)))
--         goldstandard.deepSearchCurrent = 'caps'
--         goldstandard.tableDeep = 0
--         goldstandard.tablePath ={}
--         goldstandard.deepPrint2(itemCaps,'itemStack')
            --print('new_t1' .. ' ' ..dump(goldstandard.new_t))
            goldstandard.clone(itemCaps,goldstandard.new_t,i)
         
            
    end
end


function goldstandard.toolcapsValue()
    for i,v in pairs(core.registered_items) do
        local itemstack=ItemStack(i)
        local itemdef=itemstack:get_definition()
        local itemcaps=itemdef.tool_capabilities
        print(i.. ' ' .. dump(itemcaps))  
    end
end

function goldstandard.craftValue()
    for i,v in pairs(minetest.registered_items)do
		print(tostring(i))
		local recipes = minetest.get_craft_recipe(i)
        print(recipes.items)
		if recipes.items then
			for ii,vv in pairs(recipes.items)do
				print(tostring(ii .. ' ' ..vv))
            end
        end
    end
end
local counter =  {}
minetest.register_on_joinplayer(function(player)
--     goldstandard.oreValue()
-- 	goldstandard.toolcapsValue()
--     goldstandard.craftValue()
--     goldstandard.digTimeValue()
goldstandard.toolParse()

    --print(dump(exList))
--     goldstandard.clone(exList,goldstandard.new_t)
print('new_t2' .. ' ' ..dump(goldstandard.new_t))
    --     goldstandard.DeepPrint3(exList,'exList')
    --print(dump(goldstandard.aaa))

	--[[print('ciao')
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
--        end
--    end
--end
--for k,v in spairs(borsa, function(t,a,b) return t[b] < t[a] end) do
--    print(k,v)
--end
--	print(tostring('444444444444444444444444444444444444444444444444444444444444444444'))
--	print(dump(minetest.registered_ores))
    

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




