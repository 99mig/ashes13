extends Node

static func startup_decks() :
	var ActiveDecksData = Game.Main.GameController.Systems.CardSetSystems.DecksController.ActiveDecksData
	print_debug("Startup decks: ", ActiveDecksData)
	for deck in ActiveDecksData :
		var new_cardset = Game.Main.GameController.Systems.CardSetSystems.CardSetsFactory.create_new_cardset(deck, ActiveDecksData[deck])
		var new_holder = Game.Main.GameController.Systems.PlaymatSystem.ComponentsFactory.create_new_holder("DisplayHolder", "Holder_02", Vector2.ZERO, new_cardset)
		# Playmat.Main.ActiveHolders.add_child(new_holder)
