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


func _on_exit() -> void:
	pass
