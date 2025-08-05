extends Node

static var ActivePlaymatTiles : Dictionary = {}

static func set_active_playmat_tiles(active_tiles : Dictionary) -> bool:
	#recive el json y guarda el diccionario resultante
	if active_tiles is Dictionary:
		ActivePlaymatTiles = active_tiles
		return true
	return false
