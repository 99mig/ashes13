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
