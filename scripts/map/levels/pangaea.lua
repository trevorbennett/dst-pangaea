roomList = {"Marsh","Forest","BarePlain","Plain","Clearing"};
FORCE_CONNECTED = "ForceConnected"

for i,v in ipairs(roomList) do
  AddRoomPreInit(i, function(room)
    addConnectedTag(room)
    end
  )
end

function addConnectedTag(room)
    table.insert(room.tags, FORCE_CONNECTED)
    end
