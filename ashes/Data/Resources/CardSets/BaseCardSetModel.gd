class_name BaseCardSetModel extends Resource

@export var CardSetID : String = "00_00_CardSet"

@export var DateCreated : String = "010101"
@export var CreatedBy : String = "Ashes"

@export var Title : String = "Card Set Base"
@export_multiline var Description : String = "Base card description"

@export var Type : GlobalData.CardSetTypes = GlobalData.CardSetTypes.BaseCardSet

@export var FrontCard : String

@export var CardsOnSet : Array[String] = []



func load_data(cardset_id: String, data: Dictionary) -> void:
	CardSetID = cardset_id
	for key in ["Title", "Description", "Type", "DateCreated", "CreatedBy", "FrontCard", "CardsOnSet"]:
		if data.has(key):
			self.set(key, data[key])
