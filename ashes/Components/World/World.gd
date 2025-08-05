class_name World
extends Node2D

static var Main: World

func _init() -> void: 
	Main = self

##----------------------------------------------------------------##



@onready var Camera: Camera2D = $Camera


func _process(delta: float) -> void:
	UI.Main.DebugPanel.MousePosition.text = str(get_global_mouse_position())
	UI.Main.DebugPanel.MouseCoords.text = str(Playmat.Main.ComponentsLayer.map_to_local(get_global_mouse_position()))
