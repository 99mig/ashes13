"""
Este controller general se encarga de la logica relacionada a los CardSets activos
"""
static var ActiveCardSets : Dictionary = {}

static func set_active_card_sets(active_sets : Dictionary) -> bool:
	#recive el json y guarda el diccionario resultante
	if active_sets is Dictionary:
		ActiveCardSets = active_sets
		return true
	return false


static func get_card_data_by_id(card_id) :
	return ActiveCardSets[card_id]
