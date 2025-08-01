static func execute_component_function(component: Node, component_type: String) -> void:
	# Get the actions for the current game state
	var state_actions = GlobalData.ActionsOnState.get(Game.Main.CurrentGameState, {})
	# Get the action types for this component type
	var action_types = state_actions.get(component_type, [])
	
	if action_types.size() > 0:
		var action_type = action_types[0]  # Get the first action type
		# Get the function name from the component's actions_on_state
		var function_name = component.ActionsOnState.get(action_type, "")
		
		if function_name and component.has_method(function_name):
			component.call(function_name)
		else:
			print_debug("Function ", function_name, " not found in component")
	else:
		print_debug("No actions defined for component type: ", component_type)




"""
Actions
"""
enum ActionType {
	EditComponent,
	SelectComponent,
	DragComponent
}
# Diccionario que mapea estados a acciones permitidas
var ActionsOnState: Dictionary = {
	GlobalData.MainGameState.Start: {
		"DeckCardSet": [ActionType.DragComponent]
	},

	GlobalData.MainGameState.Playmat: {
		"CardSlot": [ActionType.SelectComponent],
		"EquipSlot": [ActionType.SelectComponent],
	},
	
	GlobalData.MainGameState.EditPlaymat: {
		"CardSlot": [ActionType.EditComponent],
	}
}
