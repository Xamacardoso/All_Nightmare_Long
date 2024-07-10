extends Node


func _ready():
	applyCustomMouseCursor();
	OS.window_fullscreen = false

##Set the mouse cursor image
func applyCustomMouseCursor():
	Input.set_custom_mouse_cursor(
		load("res://assets/ui/cursor/PNG/Outline Retina/aim.png"),
		0,
		Vector2(72,72)
	);

##Change the game screen mode
func toggleFullscreenMode() -> void:
	OS.window_fullscreen = not OS.window_fullscreen;
