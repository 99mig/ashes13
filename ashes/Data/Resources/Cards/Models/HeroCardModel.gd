class_name HeroCardModel
extends BaseCardModel

@export var HeroRace : String = "Hero Race"

@export var Health : int = 0
@export var MagicPower : int = 0
@export var PhysicalPower : int = 0
@export var Intelligence : int = 0

@export var HeroResistances : Array[BaseResistanceModel]


func load_data(card_id: String, data: Dictionary) -> void:
	CardID = card_id
	for key in ["HeroRace", "Health", "MagicPower", "PhysicalPower", "Intelligence", "HeroResistances"]:
		if data.has(key):
			if key == "HeroResistances" :
				pass
			else:
				self.set(key, data[key])
