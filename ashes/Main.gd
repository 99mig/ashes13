# Main Game
# A comprehensive player movement and interaction system
# @tags: core, player, movement
# @author: GameDev Team
# @version: 1.2.0

class_name Game
extends Node

## Main player character controller with movement and abilities
## Handles input processing, physics, and state management
## @tags: main, controller

# Main var
# @tags: movement, config
static var Main: Game ## Main reference


## @func_doc
## @description inicia la refelrencia globar del MainGame
## @tags init
func _init() -> void: 
	# refernecia principal
	Main = self

# @const_title: gamecontroller
# cargamos el game controller principal
const GameController = preload("res://Controllers/GameController.gd")

# @var_title: GameInput 
# Variables en Main en nodos
# Los inputs del juego
@onready var GameInput: GameInput = $Input

# @var_title: world
# el mundo
@onready var World: Node2D = $World

## @var_doc
## @description UI main refernece
## @tags HUD
@onready var UI: Control = $UI

## @var_doc
## @description holds the current game state
## @tags onready
@onready var CurrentGameState = GlobalData.MainGameState.Start


func _ready() -> void:
	_set_main_state_machine()

## @func_doc
## @description inicia el state machine principal
## agrega el machine a la scene main
## @return void
## @tags tag1, tag2, tag3  
func _set_main_state_machine() -> void :
	# en esta variable se inicializa el scipt
	var MainStateMachineScene = load(GlobalData.MainGameStateMachine).instantiate() # no se si hay dif de comment
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
	Todos los scripts con funciones q devuelven algo, q se usan
	repetidamente en varias cosas
Systems
	Maneja los systemas del gameplay q no necesitan escenas directas
	como las acciones

"""
