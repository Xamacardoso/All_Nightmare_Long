extends KinematicBody2D;
class_name BasePlayer

# Attributes
export var velocity: float = 10;

func _ready():
	pass

func _physics_process(delta):
	move_and_slide(_movement() * velocity);
	
func _movement() -> Vector2:
	var _mov = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down");
	_handle_sprite(_mov);
	return _mov.normalized();
	
func _handle_sprite(mov_vector):
	if mov_vector != Vector2.ZERO:
		pass
	else:
#		idle
		pass
	
