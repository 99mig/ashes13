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
		"CardSet" : [ActionType.DragComponent]
	},

	GlobalData.MainGameState.Playmat: {
		"CardSlot": [ActionType.SelectComponent],
		"EquipSlot": [ActionType.SelectComponent],
	},
	
	GlobalData.MainGameState.EditPlaymat: {
		"CardSlot": [ActionType.EditComponent],
	}
}





static func execute_component_function(component: Node, component_type: String) -> void:
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
