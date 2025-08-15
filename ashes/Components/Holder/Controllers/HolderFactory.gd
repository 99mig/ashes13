"""
aca estan las funciones q crean los respectivos componentes del mapa
slots y holder 
"""



static func create_new_holder(holder_type, holder_position, to_hold):
	var new_holder_scene = load(GlobalData.HolderScene).instantiate()
	var holder_tile_block = Game.Main.GameController.Systems.PlaymatSystems.PlaymatTilesController.get_active_tile_for_component(holder_type)
	var new_holder_resource =  load(GlobalData.TileBlocksIndex[holder_tile_block])
	

	new_holder_scene.HolderType = GlobalData.HolderTypes.keys().find(holder_type)
	new_holder_scene.position = Playmat.Main.ComponentsLayer.map_to_local(holder_position)
	print_debug("POSITIONS 2: ", new_holder_scene.position)
	new_holder_scene.ComponentType = GlobalData.ComponentType.Holder
	new_holder_scene.set_name(str(holder_type) + "_" + str(holder_position))
	Playmat.Main.ActiveHolders.add_child(new_holder_scene)
	new_holder_scene.set_holder_resource(new_holder_resource)
	new_holder_scene.set_to_hold(to_hold)
	
	return true

static func create_new_empty_holder(holder_type, holder_position):
	var new_holder_scene = load(GlobalData.HolderScene).instantiate()
	var holder_tile_block = Game.Main.GameController.Systems.PlaymatSystems.PlaymatTilesController.get_active_tile_for_component(holder_type)
	var new_holder_resource =  load(GlobalData.TileBlocksIndex[holder_tile_block])
	
	new_holder_scene.HolderType = GlobalData.HolderTypes.keys().find(holder_type)
	new_holder_scene.position = Playmat.Main.ComponentsLayer.map_to_local(holder_position)
	print_debug("POSITIONS 2: ", new_holder_scene.position)
	new_holder_scene.ComponentType = GlobalData.ComponentType.Holder
	new_holder_scene.set_name(str(holder_type) + "_" + str(holder_position))
	Playmat.Main.ActiveHolders.add_child(new_holder_scene)
	new_holder_scene.set_holder_resource(new_holder_resource)

	
	return true
	
