extends KinematicBody2D;
class_name BasePlayer

# Onready variables
onready var projectile = preload("res://scenes/combat/BoomerangProjectile.tscn");
onready var boomerang = $Boomerang;

# Other variables
var is_firing: bool;
var shooting_direction;
##TODO fazer um bumerangue que some o sprite quando eu clico e outro que é um projetil que vai e volta.

# Attributes
export var velocity: float = 10;



func _ready():
	pass

func _physics_process(delta):
	move_and_slide(_movement() * velocity);
	handle_shoot();
	
func _movement() -> Vector2:
	var _mov = Input.get_vector("left", "right", "up", "down");
	_handle_sprite(_mov);
	return _mov.normalized();
	
func _handle_sprite(mov_vector):
	if mov_vector != Vector2.ZERO:
		pass
	else:
		pass;

## Shoots the boomerang;
func shoot_boomerang():
	var _boomerang_projectile = projectile.instance();
	_boomerang_projectile.global_position = boomerang.sprite.global_position
	_boomerang_projectile.rotation = boomerang.global_rotation
	var shoot_position = _boomerang_projectile.global_position;
	get_parent().add_child(_boomerang_projectile);

	

func handle_shoot():
	if Input.is_action_just_pressed("shoot") and !is_firing:
		is_firing = true;
		shooting_direction = get_local_mouse_position();
		shoot_boomerang();
	
	if !is_firing:
		boomerang.visible = true;
		boomerang.look_at(get_global_mouse_position()); # Olha pra a posicao do mouse
	else:
		boomerang.visible = false;
		
