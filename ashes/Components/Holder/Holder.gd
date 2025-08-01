extends Node2D

@export var HolderTileBlockResource : Resource
@onready var HolderSprite: Sprite2D = $HolderSprite
@onready var HoldingScene: Node2D = $HoldingScene

@export var HolderType : GlobalData.HolderTypes
#
#var Holding : Node2D

func _ready() -> void:
	pass


func set_holder_resource(new_holder_resource) : 
	
	HolderTileBlockResource = new_holder_resource
	update_holder()


func update_holder():
	HolderSprite.texture = HolderTileBlockResource.Sprite
	
func set_to_hold(scene_to_hold):
	HoldingScene.add_child(scene_to_hold)
	#Holding = scene_to_hold
