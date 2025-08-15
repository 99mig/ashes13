"""
Actions
"""
enum ActionType {
	DragComponent,
	SelectComponent,
	EditComponent,
	HoverComponent
}
# Diccionario que mapea estados a acciones permitidas
static var ActionsOnState: Dictionary = {
	GlobalData.MainGameState.Start: {
		"CardSet" : [ActionType.HoverComponent, ActionType.DragComponent]
	},

	GlobalData.MainGameState.Playmat: {
		"CardSlot": [ActionType.SelectComponent],
		"EquipSlot": [ActionType.SelectComponent],
	},
	
	GlobalData.MainGameState.EditPlaymat: {
		"CardSlot": [ActionType.EditComponent],
	}
}





static func execute_component_action(component: Node, component_type: String) -> void:
	# Get the actions for the current game state
	print_debug("Component: ", component.name)
	print_debug("Component type: ", component_type)
	
	var state_actions = ActionsOnState.get(Game.Main.CurrentGameState, {})
	# Get the action types for this component type
	var action_types = state_actions.get(component_type, [])
	
	if action_types.size() > 0:
		var action_type = action_types[0]  # Get the first action type
		# Get the function name from the component's actions_on_state
		var function_name = component.ComponentActions.ActionsOnState.get(action_type, "")
		
		if function_name and component.ComponentActions.has_method(function_name):
			component.ComponentActions.call(function_name, component)
		else:
			print_debug("Function ", function_name, " not found in component")
	else:
		print_debug("No actions defined for component type: ", component_type)

###este es el nuevo script para ejecutar acciones recibiendo una type_action como parametro
"""
static func execute_component_action_by_event(component: Node, component_type: String, event_type: String) -> void:
	print_debug("Component: ", component.name)
	print_debug("Component type: ", component_type)
	print_debug("Event type: ", event_type)
	
	var state_actions = ActionsOnState.get(Game.Main.CurrentGameState, {})
	var action_types = state_actions.get(component_type, [])
	
	# Mapear eventos a tipos de acción
	var event_to_action = {
		"mouse_enter": ActionType.HoverComponent,
		"left_click": ActionType.SelectComponent,
		"right_click": ActionType.EditComponent,
		"drag_start": ActionType.DragComponent
	}
	
	var desired_action = event_to_action.get(event_type)
	if desired_action != null and desired_action in action_types:
		var function_name = component.ComponentActions.ActionsOnState.get(desired_action, "")
		if function_name and component.ComponentActions.has_method(function_name):
			print_debug("Executing event-based action: ", ActionType.keys()[desired_action])
			component.ComponentActions.call(function_name, component)
		else:
			print_debug("Function ", function_name, " not found in component")
	else:
		print_debug("Event not mapped to available action for component type: ", component_type)


"""
