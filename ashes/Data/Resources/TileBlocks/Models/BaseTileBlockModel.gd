class_name BaseTileBlock extends Resource

@export var TileBlockID: String = ""

@export var MaxQuantity: int

@export var Sprite: Texture

@export var Dimensions : Vector3i = Vector3i(1, 1, 1)

## DESCRIPCION DEL OBJETO
@export_multiline var Description: String

@export var CanBePlaced : bool = true

@export var Rarity : GlobalData.ObjectRarities


@export var Type : GlobalData.TileBlockTypes


@export var AtlasID: int
@export var AtlasCoords: Vector2i
