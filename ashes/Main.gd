# =========================================
# Script: Main.gd
# Propósito: Controla el comportamiento de main game
# Dependencias:
# Última modificación: 2025-08-15
# @tag: main
# =========================================

## Main game script
# This script handles player movement, combat, and interactions
# Supports keyboard and gamepad input with smooth animations
class_name Game
extends Node

static var Main: Game

func _init() -> void: 
	Main = self

# cargamos el game controller principal
const GameController = preload("res://Controllers/GameController.gd")

## Variables en Main en nodos
# Los inputs del juego
@onready var GameInput: GameInput = $Input
# el mundo
@onready var World: Node2D = $World
# la interfaz
@onready var UI: Control = $UI

@onready var CurrentGameState = GlobalData.MainGameState.Start


func _ready() -> void:
	_set_main_state_machine()

# funcion para inicializar el state machine principal 
# se agrega desde su propia escena
# @return void
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
