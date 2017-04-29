local require=GLOBAL.require

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
    print("Banana " + room)
    table.insert(room.tags, FORCE_CONNECTED)
end
