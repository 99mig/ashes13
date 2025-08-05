extends Node
"""
Main
"""
const MainGameStateMachine : String = "res://Systems/StateMachine/MainStateMachine.tscn"
enum MainGameState {
	Start,
	Playmat,
	EditPlaymat
}




"""
Game
"""

enum ValueOperators {
	Sum,
	Sub,
	Mult,
	Div
}
enum ResistanceTypes {
	Direct,
	Blue,
	Green,
	Orange,
	Purple
}
enum AbilitiesTypes{
	Damage,
	Heal,
	Effect,
	Special
}

"""
World
"""
enum CameraMode {
	FreeMode,
	FocusOn
}

enum ComponentType {
	Card,
	CardSet,
	Holder,
	EmptyHolder,
	Slot,
	EmptySlot
}
"""
Cards
"""
const CardScene : String = "res://Components/Card/Card.tscn"
enum CardTypes {
	BaseCard,
	HeroCard,
	ClassCard,
	SummonCard,
	ItemCard,
	AccesoryCard,
	InstantCard
}


"""
Card Sets
"""
const CardSetScene = "res://Components/CardSets/CardSet.tscn"


const CardSetsIndex : Dictionary = {
	"Default00" = "res://Data/Static/Json/CardSet_Default00.json"
}

const STARTER_DECKS_00 : String = "res://Data/Static/Json/StarterDecks00.json"


enum CardSetTypes {
	BaseCardSet,
	DeckCardSet,
	CollectionCardSet
}


"""
TileBlocks
"""
enum TileBlockTypes {
	Block,
	EmptyBlock,
	Slot,
	EmptySlot,
	Holder,
	EmptyHolder
}

const TileBlocksIndex: Dictionary = {
	EmptyBlock_01 = "res://Data/Resources/TileBlocks/00/EmptyBlock_01.tres",
	EmptyBlock_02 = "res://Data/Resources/TileBlocks/00/EmptyBlock_02.tres",
	EmptyBlock_03 = "res://Data/Resources/TileBlocks/00/EmptyBlock_03.tres",
	Block_01 = "res://Data/Resources/TileBlocks/00/Block_01.tres",
	Block_02 = "res://Data/Resources/TileBlocks/00/Block_02.tres",
	Block_03 = "res://Data/Resources/TileBlocks/00/Block_03.tres",
	Block_04 = "res://Data/Resources/TileBlocks/00/Block_04.tres",
	Block_05 = "res://Data/Resources/TileBlocks/00/Block_05.tres",
	Block_06 = "res://Data/Resources/TileBlocks/00/Block_06.tres",
	Block_07 = "res://Data/Resources/TileBlocks/00/Block_07.tres",
	EmptySlot_01 = "res://Data/Resources/TileBlocks/00/EmptySlot_01.tres",
	Slot_01 = "res://Data/Resources/TileBlocks/00/Slot_01.tres",
	Slot_02 = "res://Data/Resources/TileBlocks/00/Slot_02.tres",
	Slot_03 = "res://Data/Resources/TileBlocks/00/Slot_03.tres",
	EmptyHolder_01 = "res://Data/Resources/TileBlocks/00/EmptyHolder_01.tres",
	Holder_01 = "res://Data/Resources/TileBlocks/00/Holder_01.tres",
	Holder_02 = "res://Data/Resources/TileBlocks/00/Holder_02.tres",
	Holder_03 = "res://Data/Resources/TileBlocks/00/Holder_03.tres"
}



"""
Playmat
"""
const PlaymatTilesIndex : Dictionary = {
	"Default00" = "res://Data/Static/Json/PlaymatTiles_Default00.json"
}


"""
Holder
"""
const HolderScene = "res://Components/Holder/Holder.tscn"
enum HolderTypes {
	BaseHolder,
	HandHolder,
	GlobalHolder,
	DisplayHolder
}

"""
Slot
"""
const SlotScene = ""
enum SlotTypes {
	BaseSlot,
	HeroSlot,
	SummonSlot,
	ItemSlot,
	AccesorySlot,
	InstantSlot,
	DeckSlot,
	GraveyardSlot
}



"""
Objects
"""
enum ObjectRarities {
	Common,
	Uncommon,
	Rare,
	Epic,
	Legendary,
	Mythic
}
