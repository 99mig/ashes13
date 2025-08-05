# extends Node

# static var startup_decks_positions : Array[Vector2i] = [
# 	Vector2i(0, -3),
# 	Vector2i(1, -5), 
# 	Vector2i(-2, -4)
# ]

static func startup_decks() :
	var ActiveDecksData = Game.Main.GameController.Systems.CardSetSystems.DeckController.ActiveDecksData
	print_debug("Startup decks: ", ActiveDecksData)
	for deck in ActiveDecksData :
		var new_cardset = Game.Main.GameController.Systems.CardSetSystems.CardSetFactory.create_new_cardset(deck, ActiveDecksData[deck])
		
		var new_cardset_start_position = GameController.Services.DataHelper.string_to_vector2i(ActiveDecksData[deck]["StartPosition"])
		print_debug("POSITIONS 1: ", new_cardset_start_position)
		var new_holder = Game.Main.GameController.Systems.PlaymatSystem.HolderFactory.create_new_holder("DisplayHolder", "Holder_02", new_cardset_start_position, new_cardset)
		#Playmat.Main.ActiveHolders.add_child(new_holder)
	
	return true
