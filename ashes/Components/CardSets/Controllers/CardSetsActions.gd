
static var ActionsOnState : Dictionary = {
	GlobalData.ActionType.SelectComponent: "select_slot",
	GlobalData.ActionType.EditComponent: "edit_slot",
	
}


func select_slot(cardset) :
	print_debug("SELECT FUNC")
	Game.Main.Systems.Actions.start_drag(cardset)


func edit_cardset(cardset) -> void:
	print_debug("EDIT CARD ST: ", cardset)
	# Game.Main.Actions.start_edit(self)

static func hover_cardset(cardset) :
	print_debug("HOVER CARD SET: ", cardset)
