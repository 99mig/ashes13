"""
aca estan las funciones q crean los respectivos componentes del mapa
slots y holder 
"""



static func create_new_holder(holder_type, holder_tile_block, holder_position, to_hold):
	var new_holder_scene = load(GlobalData.HolderScene).instantiate()
	var new_holder_resource =  load(GlobalData.TileBlocksIndex[holder_tile_block])
	

	new_holder_scene.HolderType = GlobalData.HolderTypes.keys().find(holder_type)
	new_holder_scene.position = holder_position
	Playmat.Main.ActiveHolders.add_child(new_holder_scene)
	new_holder_scene.set_holder_resource(new_holder_resource)
	new_holder_scene.set_to_hold(to_hold)
	
	return true
