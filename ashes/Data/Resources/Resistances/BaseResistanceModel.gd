class_name BaseResistanceModel
extends Resource

@export var Type : GlobalData.ResistanceTypes = GlobalData.ResistanceTypes.Direct
@export var Operator : GlobalData.ValueOperators = GlobalData.ValueOperators.Sum
@export var Value : int = 0

func create_from_data(data: Dictionary) -> HeroCardModel:
	var card = BaseResistanceModel.new()
	if data != {} :
		card.load_from_data(data)
	return card

func load_data(data: Dictionary) -> void:
	if data.has("Type"):
		Type = GlobalData.ResistanceTypes.keys().find(data["Type"])
	if data.has("Operator"):
		Operator = GlobalData.ValueOperators.keys().find(data["Operator"])
	if data.has("Value"):
		Value = data["Value"]
