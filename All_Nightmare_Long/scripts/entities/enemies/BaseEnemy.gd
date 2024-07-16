extends KinematicBody2D
class_name BaseEnemy
var player : KinematicBody2D = null;
onready var sprite : AnimatedSprite = $AnimatedSprite;
onready var my_material : ShaderMaterial = sprite.material

export var health = 10
export var speed = 100
export var damage = 5
var velocity

func _ready():
	player = Global.player;

func _physics_process(_delta):
	move()

func move():
	if player:
		velocity = global_position.direction_to(player.global_position); # gets the vector to the player position
		move_and_slide(velocity*speed); # moves
		##TO CHANGE
		sprite.play("fly");
	
## Dies when hp reaches 0, TODO: make a dying animation or something alike
func die():
	queue_free(); 


func _on_HurtBoxComponent_parent_damaged(max_health, health):
	var _hit_material = load("res://shaders/hit_flash.tres");
	sprite.material = ShaderMaterial.new();
	sprite.material.shader = _hit_material;
	sprite.material.set_shader_param("flash_color", Color.white);
	var _tween = get_tree().create_tween();
	_tween.tween_property(sprite.material, "shader_param/flash_value", 1.0, 0.05);
	_tween.tween_property(sprite.material, "shader_param/flash_value", 0, 0.3);
