extends Node


func _ready():
	applyCustomMouseCursor();
	
	
func applyCustomMouseCursor():
	Input.set_custom_mouse_cursor(
		load("res://assets/ui/cursor/PNG/Outline Retina/aim.png"),
		0,
		Vector2(72,72)
	);
