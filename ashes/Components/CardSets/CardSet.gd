class_name BaseCardSet
extends BaseComponent

@export var CardSetResource : Resource
@export var CardSetType : GlobalData.CardSetTypes
#@export var CardSetTitle : String
@export var CardsOnSet : Array
@onready var CardSetTitle: Label = $CardSetTitle

const ComponentActions = preload("res://Components/CardSets/Controllers/CardSetActions.gd")


func set_cardset_data(cardset_resource):
	print_debug(cardset_resource)
	CardSetResource = cardset_resource
	ComponentType = GlobalData.ComponentType.CardSet

	CardSetType = cardset_resource["Type"]
	CardsOnSet = cardset_resource["CardsOnSet"]

func _ready() -> void:
	CardSetTitle.text = CardSetResource["Title"]
