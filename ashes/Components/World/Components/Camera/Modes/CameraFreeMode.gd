class_name FreeCameraMode
extends Node

var settings = CameraSettings.new()
var camera: Camera2D
var dragging := false
var drag_start_mouse: Vector2
var drag_start_camera: Vector2

func init(_camera: Camera2D) -> void:
	camera = _camera

func handle_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		
		if event.is_action_pressed("MouseWheelScrollMiddle"):
			if event.pressed:
				dragging = true
				drag_start_mouse = event.position
				drag_start_camera = camera.position
			else:
				dragging = false
		
		if event.is_action_released("MouseWheelScrollMiddle"):
			dragging = false
			
		elif event.is_action_pressed("MouseWheelScrollUp"):
			zoom_camera(-settings.zoom_step)
		elif event.is_action_pressed("MouseWheelScrollDown"):
			zoom_camera(settings.zoom_step)
	elif event is InputEventMouseMotion and dragging:
		var offset = drag_start_mouse - event.position
		var new_pos = drag_start_camera + offset
		camera.position = clamp_position(new_pos)

func clamp_position(pos: Vector2) -> Vector2:
	return Vector2(
		clamp(pos.x, settings.limit_left, settings.limit_right),
		clamp(pos.y, settings.limit_top, settings.limit_bottom)
	)

func zoom_camera(step: float) -> void:
	var new_zoom = camera.zoom + Vector2(step, step)
	new_zoom.x = clamp(new_zoom.x, settings.min_zoom, settings.max_zoom)
	new_zoom.y = clamp(new_zoom.y, settings.min_zoom, settings.max_zoom)
	camera.zoom = new_zoom
