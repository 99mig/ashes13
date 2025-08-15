class_name BaseSlot
extends BaseComponent

@export var SlotTileBlockResource : Resource
@onready var SlotSprite: Sprite2D = $SlotSprite
@onready var HoldingScene: Node2D = $HoldingScene

@export var SlotType : GlobalData.SlotTypes



func set_slot_resource(new_holder_resource) : 
	
	SlotTileBlockResource = new_holder_resource
	update_slot()


func update_slot():
	SlotSprite.texture = SlotTileBlockResource.Sprite
	
func set_to_hold(scene_to_hold):
	HoldingScene.add_child(scene_to_hold)
	#Holding = scene_to_hold
