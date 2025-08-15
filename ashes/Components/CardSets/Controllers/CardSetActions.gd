"""
Aca se definen todas las acciones por estado de los cardset
"""
static var ActionsOnState : Dictionary = {
	GameController.Systems.Actions.ActionType.DragComponent: "drag_cardset",
	GameController.Systems.Actions.ActionType.SelectComponent: "select_cardset",
	GameController.Systems.Actions.ActionType.EditComponent: "edit_cardset",
	GameController.Systems.Actions.ActionType.HoverComponent: "hover_cardset",
}


static func drag_cardset(cardset) :
	print_debug("SELECT FUNC")
	World.Main.Actions.start_drag(cardset.get_parent().get_parent())

static func select_cardset(cardset) :
	print_debug("Select: ", cardset)

static func edit_cardset(cardset) -> void:
	print_debug("EDIT CARD ST: ", cardset)
	# Game.Main.Actions.start_edit(self)

static func hover_cardset(cardset) :
	print_debug("HOVER CARD SET: ", cardset)
