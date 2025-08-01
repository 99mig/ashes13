class_name FocusOnCameraMode
extends Node

var camera: Camera2D
var target_position: Vector2
var target_zoom: float

func init(_camera: Camera2D) -> void:
	camera = _camera

func focus(focus_data : Dictionary) -> void:
	target_position = focus_data.position
	target_zoom = clamp(focus_data.zoom_factor, 0.1, 10.0) # ajusta los límites según tu juego
	set_process(true)

func _process(delta: float) -> void:
	var reached_pos = move_toward_position(delta)
	var reached_zoom = move_toward_zoom(delta)

	if reached_pos and reached_zoom:
		set_process(false)

func move_toward_position(delta: float) -> bool:
	camera.position = camera.position.lerp(target_position, delta * 4.0)
	return camera.position.distance_to(target_position) < 1.0

func move_toward_zoom(delta: float) -> bool:
	var current = camera.zoom.x
	var target = target_zoom
	var new_zoom = lerp(current, target, delta * 4.0)
	camera.zoom = Vector2(new_zoom, new_zoom)
	return abs(current - target) < 0.01
