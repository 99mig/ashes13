class_name World
extends Node2D

static var Main: World

func _init() -> void: 
	Main = self

##----------------------------------------------------------------##



@onready var Camera: Camera2D = $Camera
@onready var Actions: GameActions = $Actions


func _process(delta: float) -> void:
	UI.Main.DebugPanel.MousePosition.text = str(get_global_mouse_position())
	UI.Main.DebugPanel.MouseCoords.text = str(Playmat.Main.ComponentsLayer.local_to_map(get_global_mouse_position()))



"""
quiero hacer que la escena world tenga contenia todas las sub-partes del juego
-el playmat
-card set display
-
"""
