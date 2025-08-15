# extends Node

# static var startup_decks_positions : Array[Vector2i] = [
# 	Vector2i(0, -3),
# 	Vector2i(1, -5), 
# 	Vector2i(-2, -4)
# ]

## Funciones ##
## Inicia los decks del inicio al empezar el juego
static func startup_decks() :
	var ActiveDecksData = Game.Main.GameController.Systems.CardSetSystems.DeckController.ActiveDecksData
	print_debug("Startup decks: ", ActiveDecksData)
	for deck in ActiveDecksData :
		var new_cardset = Game.Main.GameController.Systems.CardSetSystems.CardSetFactory.create_new_cardset(deck, ActiveDecksData[deck])
		
		var new_cardset_start_position = GameController.Services.DataHelper.string_to_vector2i(ActiveDecksData[deck]["StartPosition"])
		print_debug("POSITIONS 1: ", new_cardset_start_position)
		var new_holder = Game.Main.GameController.Systems.PlaymatSystems.HolderFactory.create_new_holder("DisplayHolder", new_cardset_start_position, new_cardset)
		if new_holder:
			print_debug("New holder created: ", new_holder)
		else:
			printerr("Can't create new holder")
	
	return true

## Inicia el playmat
static func startup_playmat() :
	var active_playmat = Game.Main.GameController.Systems.PlaymatSystems.PlaymatTilesController.get_active_playmat()
	print_debug("Active playmat: ", active_playmat)
	for component_type in active_playmat :
		print_debug("Component type: ", component_type)
		for component in active_playmat[component_type] :
			var new_component = false
			print_debug("Component: ", component)
			var new_component_position = GameController.Services.DataHelper.string_to_vector2i(active_playmat[component_type][component])
			if component_type == "Slot" :
				new_component = Game.Main.GameController.Systems.PlaymatSystems.SlotFactory.create_new_empty_slot(component, new_component_position)
			elif component_type == "Holder" :
				new_component = Game.Main.GameController.Systems.PlaymatSystems.HolderFactory.create_new_empty_holder(component, new_component_position)
			else :
				print_debug("Component type not found: ", component_type)
			if new_component:
				print_debug("New component created: ", new_component)
			else:
				printerr("Can't create new component")
	return true
