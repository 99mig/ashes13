## @class_doc
## @description Game Controller - A comprehensive player movement and interaction system
## Handles input processing, physics, and state management for the main character
## @tags core, controller
## @depends Main: manages the game flow
class_name GameController
extends Node
"""
Este es el controlador principal de todo eel flujo del juego

cada GameState al entrar al estado va a llamar funciones de este script
"""

## Constantes ##
const Services = preload("res://Services/MainServices.gd") ## Se cargan el MainService
const Systems = preload("res://Systems/MainSystems.gd") ## Se carga el main Systems

const StartupController = preload("res://Controllers/StartupController.gd") ## Se carga e startupController


## Esta es la funcion que se llama apra cargar todos los archivos que contiene la informacion en tipo JSON
## @obs1: se llama desde el state incial de state_machine
## @return bool - True si se cargo correctamente todo
static func load_game() -> bool :
	
	"""
	aca debe ir la logica de cargar las cartas y el playmat x default
	y luego debe hacer el display de los heroes
	"""
	#primero cargar los jsons con los datos del set de cartas
	var card_sets_data = Services.StaticFileLoader.load_static_json(GlobalData.CardSetsIndex.Default00)
	if card_sets_data == {} :
		print_debug("Can't load card set data")
		return false
	print_debug("Card set data loaded")
	#populando la variable con el set de cartas activas
	if !Systems.CardSetSystems.CardSetController.set_active_card_sets(card_sets_data):
		print_debug("Can't active card sets")
		return false
	print_debug("Card set data active")
	
	#segundo cargar los jsons con los datos del playmat default
	var playmat_tiles_data = Services.StaticFileLoader.load_static_json(GlobalData.PlaymatTilesIndex.Default00)
	if playmat_tiles_data == {} :
		print_debug("Can't load tile blocks data")
		return false
	#popular la variable con los tileblocks activos
	if !Systems.PlaymatSystems.PlaymatTilesController.set_active_playmat_tiles(playmat_tiles_data):
		print_debug("Can't active tile blocks")
		return false
		
	print_debug("Tile blocks data active")
	
	
	# cargar los decks
	var deck_default_data = Services.StaticFileLoader.load_static_json(GlobalData.STARTER_DECKS_00)
	if deck_default_data == {} :
		print_debug("Can't load default decks")
		return false
	
	if !Systems.CardSetSystems.DeckController.set_active_card_decks(deck_default_data):
		print_debug("Can't active the default decks")
		return false
	
	return true


static func start_game() -> bool :
	if !StartupController.startup_decks() :
		printerr("Can't startup decks")
		return false
	if !StartupController.startup_playmat() :
		printerr("Can't startup playmat")
		return false
	return true
		
