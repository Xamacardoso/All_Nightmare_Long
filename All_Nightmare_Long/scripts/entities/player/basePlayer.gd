extends KinematicBody2D;
class_name BasePlayer

# Onready variables
onready var projectile = preload("res://scenes/combat/BoomerangProjectile.tscn");
onready var boomerang = $Boomerang;

##TODO fazer um bumerangue que some o sprite quando eu clico e outro que é um projetil que vai e volta.

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
		pass;


