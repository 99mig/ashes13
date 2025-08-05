extends Node

static var ActiveDecksData : Dictionary = {}

static func set_active_card_decks(active_decks : Dictionary) -> bool:
	#recive el json y guarda el diccionario resultante
	if active_decks is Dictionary:
		ActiveDecksData = active_decks
		#print_debug("Active decks: ", ActiveDecksData)
		return true
	print_debug("Can't active the decks")
	return false


# static func create_deck_resources(deck_dictionary) -> Dictionary :
# 	var new_deck_resources = {}
	
# 	for card in deck_dictionary :
# 		print("deck_dictionary: ", deck_dictionary)
# 		var new_card_data = Game.Main.GameController.Systems.CardSystems.CardSetsController.get_card_data_by_id(card)
# 		print("card: ", new_card_data)
		
# 		var new_card_resource = Game.Main.GameController.Systems.CardSystems.CardFactory.create_card_resource(card, new_card_data)
# 		new_deck_resources[card] = new_card_resource
# 	return new_deck_resources
