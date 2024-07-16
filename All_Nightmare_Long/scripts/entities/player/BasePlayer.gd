extends KinematicBody2D;
class_name BasePlayer

# Onready variables
onready var projectile = preload("res://scenes/combat/BoomerangProjectile.tscn");
onready var boomerang = $Boomerang;
onready var sprite: AnimatedSprite = $Sprite;
onready var hurtbox = $HurtBoxComponent
onready var my_material = sprite.material

# Other variables
var is_firing: bool;
var hasBoomerang: bool = false;
var shooting_direction;


# Attributes
export var velocity: float = 10;
export var damage: float = 5;

func _ready():
	Global.player = self
	hurtbox.health_component.health = Global.playerHealth


func _physics_process(delta):
	hasBoomerang = Global.playerHasBoomerang
	move_and_slide(_movement() * velocity);
	handle_shoot();
	
func _movement() -> Vector2:
	var _mov = Input.get_vector("left", "right", "up", "down");
	_handle_sprite(_mov);
	return _mov.normalized();

## Handles sprite animation
func _handle_sprite(mov_vector):
	if mov_vector != Vector2.ZERO:
		if mov_vector.x:
			sprite.play("walk_h");
			sprite.flip_h = false if mov_vector.x > 0 else true;
		else:
			var _vertical_anim = "walk_down" if mov_vector.y >= 0 else "walk_up";
			sprite.play(_vertical_anim);
	else:
		sprite.play("idle");

## Shoots the boomerang;
func shoot_boomerang():
	if hasBoomerang:
		var _boomerang_projectile = projectile.instance();
		_boomerang_projectile.global_position = boomerang.sprite.global_position;
		_boomerang_projectile.rotation = boomerang.global_rotation;
		var shoot_position = _boomerang_projectile.global_position;
		get_parent().add_child(_boomerang_projectile);

	
## Handles shooting mechanic, when the player can or can't shoot
func handle_shoot():
	if Input.is_action_just_pressed("shoot") and !is_firing:
		if hasBoomerang:
			is_firing = true;
			shooting_direction = get_local_mouse_position();
			shoot_boomerang();
	
	if !is_firing and hasBoomerang:
		boomerang.visible = true;
		boomerang.look_at(get_global_mouse_position()); # Olha pra a posicao do mouse
	else:
		boomerang.visible = false;
		

## Dies
func die():
	sprite.play("die");
	boomerang.visible = false;
	$HurtBoxComponent.queue_free();
	set_physics_process(false);
	yield(sprite, "animation_finished");
	Global.changeScene("res://scenes/menus/startMenu.tscn")
	




func _on_damage(max_health, health):
	var _hit_material = load("res://shaders/hit_flash.tres");
	sprite.material = ShaderMaterial.new();
	sprite.material.shader = _hit_material;
	sprite.material.set_shader_param("flash_color", Color.white);
	var _tween = get_tree().create_tween();
	_tween.tween_property(sprite.material, "shader_param/flash_value", 1.0, 0.05);
	_tween.tween_property(sprite.material, "shader_param/flash_value", 0, 0.3);
	Global.playerHealth = health
	print(Global.playerHealth)
