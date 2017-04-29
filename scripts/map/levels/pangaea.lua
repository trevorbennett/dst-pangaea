local require=GLOBAL.require

require("map/network")
require("map/terrain")
require("map/rooms/forest")


-- roomList = {"Marsh","Forest","BarePlain","Plain","Clearing","BGSavanna", "BeeClearing", "Pondopolis", "BGGrass", "BGRocky", "Graveyard", "DeepForest", "CritterDen", "Rocky", "SlightlyMermySwamp",
-- 							"BeeClearing", "FlowerPatch", "BeeQueenBee", "PigKingdom", "ForestMole", "MoonbaseOne", "WalrusHut_Grassy", "BGMarsh", "BGChessRocky", "BGNoise", "BGDeepForest", "BGCrappyForest",
-- 							"SpiderForest", "BGForest", "BGGrassBurnt"}
FORCE_CONNECTED = "ForceConnected"

for i,v in ipairs(roomList) do
  AddRoomPreInitAny(addConnectedTag(i))
end

local function addConnectedTag(room)
    print("PangaeaRoom: ", room)
    table.insert(room.tags, FORCE_CONNECTED)
end

local function Graph:ApplyPoisonTag()
	local nodes = self:GetNodes(true)
	for k,node in pairs(nodes) do
		if IsNodeTagged(node, "ForceDisconnected") then --or string.find(node.id, "LOOP_BLANK_SUB")~=nil then
			WorldSim:ClearNodeLinks(node.id)
			WorldSim:SetNodeType(node.id, 1) -- BLANK
  	else
  		local flags = 0x000002
  		WorldSim:SetSiteFlags(node.id, flags)
    end
	end
	local children = self:GetChildren()
	for k,child in pairs(children) do
		child:ApplyPoisonTag()
	end
end
