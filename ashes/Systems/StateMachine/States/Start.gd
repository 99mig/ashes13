extends GameState


func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	if Game.Main.CurrentGameState == GlobalData.MainGameState.Playmat :
		transition.emit("playmat")


func _on_enter() -> void:
	print_debug("-----ACTIVE STATE START-----")
	var game_loaded = Game.Main.GameController.load_game()
	
	if !game_loaded :
		print_debug("El juego no se pudo cargar")
		return
	
	var game_Started = Game.Main.GameController.start_game()
	
	if !game_Started :
		print_debug("El juego no pudo comenzar correctamente")
		return
	#UI.Main.UIController.set_active_screen("StartScreen")

func _on_exit() -> void:
	pass
