static func create_new_empty_slot(slot_type, slot_position):
	var new_slot_scene = load(GlobalData.SlotScene).instantiate()
	var slot_tile_block = Game.Main.GameController.Systems.PlaymatSystems.PlaymatTilesController.get_active_tile_for_component(slot_type)
	var new_slot_resource =  load(GlobalData.TileBlocksIndex[slot_tile_block])
	

	new_slot_scene.SlotType = GlobalData.SlotTypes.keys().find(slot_type)
	new_slot_scene.position = Playmat.Main.ComponentsLayer.map_to_local(slot_position)
	print_debug("POSITIONS 2: ", new_slot_scene.position)
	new_slot_scene.ComponentType = GlobalData.ComponentType.Slot
	new_slot_scene.set_name(str(slot_type) + "_" + str(slot_position))
	Playmat.Main.ActiveSlots.add_child(new_slot_scene)
	new_slot_scene.set_slot_resource(new_slot_resource)
	
	return true
