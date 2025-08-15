"""
script que controla las actions in game
"""
class_name GameActions
extends Node2D

var object_being_dragged
var is_component_being_dragged = false




func _physics_process(delta: float) -> void:
	
	if object_being_dragged :
		print_debug("CARD ACTIONS", object_being_dragged)
		var mouse_pos = World.Main.get_global_mouse_position()
		object_being_dragged.position = Vector2(	clamp(mouse_pos.x, World.Main.Camera.get_camera_rect().position.x, World.Main.Camera.get_camera_rect().end.x),
												clamp(mouse_pos.y, World.Main.Camera.get_camera_rect().position.y, World.Main.Camera.get_camera_rect().end.y))





"""
	SELECT COMPONENT
"""

func in_select_component(component):
	var zoom_factor = 2
	Game.Main.Camera.set_focus_to(component.position, zoom_factor)

func out_select_component():
	Game.Main.Camera.reset_to_default()


"""
	DRAG
"""

func start_drag(component) :
	print_debug("START DRAG: ", component)
	object_being_dragged = component
	is_component_being_dragged = true
	object_being_dragged.scale = Vector2(1.1,1.1)


func finish_drag() :
	if object_being_dragged:
		object_being_dragged.scale = Vector2(1,1)
		object_being_dragged.position = Playmat.Main.ComponentsLayer.map_to_local(Playmat.Main.ComponentsLayer.local_to_map(object_being_dragged.position))
		object_being_dragged = null
