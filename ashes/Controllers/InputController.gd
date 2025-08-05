class_name GameInput
extends Node2D


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("MouseLeftClick"):
			print("Left click")
			var component_clicked = raycast_check_for_areas()
			if component_clicked:
				print_debug(component_clicked)
				var component_clicked_type = component_clicked.get_component_type()
				print_debug(component_clicked_type)
				GameController.Systems.Actions.execute_component_function(component_clicked, GlobalData.ComponentType.keys()[component_clicked_type])

		elif event.is_action_released("MouseLeftClick"):
			print("out Left click")
			if Game.Main.Actions.is_component_being_dragged:
				Game.Main.Actions.finish_drag()
		elif event.is_action_pressed("MouseRightClick"):
			print("Right click")
		elif event.is_action_released("MouseRightClick"):
			print("out Right click")



func raycast_check_for_areas() :
	var space_state = get_world_2d().direct_space_state
	var parameters = PhysicsPointQueryParameters2D.new()
	parameters.position = get_global_mouse_position()
	parameters.collide_with_areas = true
	
	var result = space_state.intersect_point(parameters)
	
	if result.size() > 0 :
		return result[0].collider.get_parent()
	return null
