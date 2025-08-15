# =========================================
# Script: GameInput.gd
# Propósito: Controla los inputs del juego y sus ejecuciones
# Dependencias: Main.gd
# Última modificación: 2025-08-15
# @tag: main, game_inpout
# =========================================

class_name GameInput
extends Node2D

## Controla todos los diferentes entradas de input al juego y ejecuta su respectivo script
## @param event (InputEvent) - El evento ocurrido
## @return void
## @obs1: reacciona a cada input
## @obs2: Considerar velocidad de terreno.
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("MouseLeftClick"):
			print("Left click")
			var component_clicked = raycast_check_for_areas()
			if component_clicked:
				print_debug(component_clicked)
				var component_clicked_type = component_clicked.get_component_type()
				print_debug(component_clicked_type)
				GameController.Systems.Actions.execute_component_action(component_clicked, GlobalData.ComponentType.keys()[component_clicked_type])

		elif event.is_action_released("MouseLeftClick"):
			print("out Left click")
			## Esta interaccion debo de cambiarla para q aactue consecuente al sistema
			## que cada que se active una funcion se almacene en una variable cual accion es 
			## y dependiendo de la accion q sea saber q contra'accion realizar
			if World.Main.Actions.is_component_being_dragged:
				World.Main.Actions.finish_drag()
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
