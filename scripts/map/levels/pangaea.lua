require("map/tasks")

AddLevel(LEVELTYPE.SURVIVAL, {
  id= "Hello Sam",
  name="Sam's World",
  desc="Sam is getting paid right now",
  overriders= {
    {"start_setpiece", "DefaultStart"},
    {"start_node","Clearing"},
  },
  tasks={
    "SamTask",
  },
})
