#extends Node

static var ActiveCardSets : Dictionary = {}

static func set_active_card_sets(active_sets : Dictionary) -> bool:
	#recive el json y guarda el diccionario resultante
	if active_sets is Dictionary:
		ActiveCardSets = active_sets
		return true
	return false

#
#static func get_card_data_by_id(card_id) :
	#return ActiveCardSets[card_id]


#static func create_new_card_set(holder_type, holder_tile_block, holder_position, to_hold):
	#var new_holder_scene = load(GlobalData.HolderScene).instantiate()
	#var new_holder_resource =  load(GlobalData.TileBlocksIndex[holder_tile_block])
	#
#
	#new_holder_scene.HolderType = GlobalData.HolderTypes.keys().find(holder_type)
	#new_holder_scene.position = holder_position
	#Playmat.Main.ActiveHolders.add_child(new_holder_scene)
