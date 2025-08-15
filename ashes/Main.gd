## Main Game
# Main player movement and input handling system
# 
# This script manages player movement, jumping, and input processing.
# It extends CharacterBody2D and provides smooth movement mechanics.
#
# @author: Your Name
# @version: 1.0
# @since: 2024-01-01z

class_name Game
extends Node

static var Main: Game

func _init() -> void: 
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

# @func_title: move_player
# Handles player movement based on input
#
# This function processes input from the player and applies movement
# to the character body. It includes acceleration, deceleration,
# and collision handling.
#
# @param delta: The time elapsed since the last frame
# @param input_vector: Vector2 representing input direction
# @return: bool - True if movement was successful
# @example:
#   var success = move_player(delta, Vector2(1, 0))
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
	Todos los scripts con funciones q devuelven algo, q se usan
	repetidamente en varias cosas
Systems
	Maneja los systemas del gameplay q no necesitan escenas directas
	como las acciones

"""
