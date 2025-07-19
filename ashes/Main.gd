class_name Game
extends Node

static var Main: Game

func _init() -> void: 
	Main = self

##----------------------------------------------------------------##


@onready var GameInput: GameInput = $Input
@onready var World: Node2D = $World
@onready var UI: Control = $UI


@onready var CurrentGameState = GlobalData.MainGameState.Start


func _ready() -> void:
	_set_main_state_machine()


func _set_main_state_machine() -> void :
	var MainStateMachineScene = load(GlobalData.MainGameStateMachine).instantiate()
	add_child(MainStateMachineScene)




"""
Notacion del proyecto


Nombres de archivos, variables, referencias
	NombreDeLaVariable

Nombres de funciones y variables declaradas dentro de funciones
	todo_en_minuscula


Components
	Aca van todos los actores y cosas q componen el gameplay
Controllers
	Maneja la logica y el orden de las operaciones, usa las funciones de services
Data
	Todos los scripts q son datos, estaticos y globales
Services
	Todos los scripts con funciones q devuelven algo, q se usan repetidamente en varias cosas
Systems
	Maneja los systemas del gameplay como las acciones

"""
