class_name Playmat
extends Node2D

static var Main: Playmat

func _init() -> void: 
	Main = self

##----------------------------------------------------------------##

@onready var ActiveHolders: Node2D = $ActiveHolders
@onready var ActiveSlots: Node2D = $ActiveSlots

@onready var BackgroundLayer: TileMapLayer = $BackgroundLayer
@onready var ComponentsLayer: TileMapLayer = $ComponentsLayer
