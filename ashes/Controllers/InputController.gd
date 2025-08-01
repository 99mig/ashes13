class_name GameInput
extends Node2D


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("MouseLeftClick"):
			print("Left click")
			var object = raycast_check_for_areas()
			if object:
				print_debug(object)
				var object_type = object.get_object_type()
				print_debug(object_type)
				Game.Main.Systems.Actions.execute_component_function(object, GlobalData.MapComponent.keys()[object_type])

		elif event.is_action_released("MouseLeftClick"):
			print("out Left click")
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
