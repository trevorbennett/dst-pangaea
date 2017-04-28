
function Graph:ApplyPoisonTag()
	local nodes = self:GetNodes(true)
	for k,node in pairs(nodes) do
		-- TODO: Need to handle BG nodes
		if IsNodeTagged(node, "ForceDisconnected") then --or string.find(node.id, "LOOP_BLANK_SUB")~=nil then
			WorldSim:ClearNodeLinks(node.id)
			
			-- TODO: Move this to a more generic location
			WorldSim:SetNodeType(node.id, 1) -- BLANK
		end
		local flags = 0
	  flags = flags + 0x000002
		WorldSim:SetSiteFlags(node.id, flags)
	end
	-- Process the graph and unlink any poisoned nodes
	local children = self:GetChildren()
	for k,child in pairs(children) do
		child:ApplyPoisonTag()
	end	
end
