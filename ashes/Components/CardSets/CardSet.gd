extends Node2D

@export var CardSetResource : Resource
@export var CardSetType : GlobalData.CardSetTypes
@export var CardSetTitle : String
@export var CardsOnSet : Array


func set_cardset_data(cardset_resource):
	CardSetResource = cardset_resource
	CardSetTitle = cardset_resource["Name"]
	CardSetType = cardset_resource["Type"]
	CardsOnSet = cardset_resource["CardsOnSet"]
