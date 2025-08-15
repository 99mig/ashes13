extends Node

static var ActivePlaymatTiles : Dictionary = {}

static func set_active_playmat_tiles(active_tiles : Dictionary) -> bool:
	#recive el json y guarda el diccionario resultante
	if active_tiles is Dictionary:
		ActivePlaymatTiles = active_tiles
		return true
	return false

static func get_active_tile_for_component(component_type) :
	# if not ActivePlaymatTiles.has("ActiveTiles"):
	# 	printerr("ActiveTiles not found in ActivePlaymatTiles")
	# 	return ""
	# if not ActivePlaymatTiles["ActiveTiles"].has(component_type):
	# 	printerr("Component type '", component_type, "' not found in ActiveTiles")
	# 	return ""
	return ActivePlaymatTiles["ActiveTiles"][component_type]

static func get_active_playmat():
	return ActivePlaymatTiles["ActivePlaymat"]
