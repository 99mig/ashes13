extends Camera2D

var FreeMode : FreeCameraMode
var FocusOn : FocusOnCameraMode



var CurrentCameraMode: GlobalData.CameraMode = GlobalData.CameraMode.FreeMode
	
func _ready():
	FreeMode = FreeCameraMode.new()
	FocusOn = FocusOnCameraMode.new()

	add_child(FreeMode)
	add_child(FocusOn)

	FreeMode.init(self)
	FocusOn.init(self)

	set_camera_mode(GlobalData.CameraMode.FreeMode)

func _unhandled_input(event: InputEvent) -> void:
	if CurrentCameraMode == GlobalData.CameraMode.FreeMode:
		FreeMode.handle_input(event)

func set_camera_mode(mode: GlobalData.CameraMode, data := {}) -> void:
	CurrentCameraMode = mode

	FreeMode.set_process(false)
	FocusOn.set_process(false)

	match mode:
		GlobalData.CameraMode.FreeMode:
			FreeMode.set_process(true)

		GlobalData.CameraMode.FocusOn:
			FocusOn.focus(data)
			FocusOn.set_process(true)




func get_camera_rect() -> Rect2:
	var camera_center = get_screen_center_position()
	var camera_viewport = get_canvas_transform().affine_inverse().basis_xform(get_viewport_rect().size)
	var half_viewport = camera_viewport * 0.5
	return Rect2((camera_center.x - half_viewport.x), (camera_center.y - half_viewport.y), camera_viewport.x, camera_viewport.y)
