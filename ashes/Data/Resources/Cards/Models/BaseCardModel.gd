class_name BaseCardModel extends Resource

@export var CardID : String = "00_00_Card"

@export var Number : int = 001
@export var Collection : int = 00

@export var Name : String = "Card Base"
@export var Title : String = "Card Title"
@export_multiline var Description : String = "Base card description"

@export var Type : GlobalData.CardTypes = GlobalData.CardTypes.BaseCard

@export var Illustration : Texture2D

@export var Rarity : GlobalData.ObjectRarities = GlobalData.ObjectRarities.Common




func load_data(card_id: String, data: Dictionary) -> void:
	CardID = card_id
	for key in ["Name", "Title", "Description", "Type", "Collection", "Number", "Rarity"]:
		if data.has(key):
			self.set(key, data[key])
