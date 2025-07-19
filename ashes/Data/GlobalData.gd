extends Node
"""
Main
"""
const MainGameStateMachine : String = "res://Systems/StateMachine/MainStateMachine.tscn"
enum MainGameState {
	Start,
	Playmat
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

"""
Cards
"""
const CardScene : String = "res://Components/Card/Card.tscn"
enum CardTypes {
	BaseCard,
	HeroCard,
	ProfessionCard,
	InvocationCard,
	ItemCard,
	ResponseCard
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
