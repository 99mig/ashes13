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

## Handle physics processing each frame
## Manages movement, jumping, and gravity
## @param delta: Time since last frame in seconds
## @tags: physics, movement, core
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

# @var_title: speed
# Maximum movement speed of the player
# @type: float
# @default: 300.0
# @range: 0.0 to 1000.0
@onready var UI: Control = $UI

@onready var CurrentGameState = GlobalData.MainGameState.Start


func _ready() -> void:
	_set_main_state_machine()

## anade el state machine principal
## Manages ssssssssssssravity
## @return: void
## @tags: physics, movement, core
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
