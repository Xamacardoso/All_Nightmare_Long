extends KinematicBody2D
class_name BaseEnemy
var player : KinematicBody2D = null;
onready var animated_sprite = $AnimatedSprite;

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
		animated_sprite.play("fly");
	
## Dies when hp reaches 0, TODO: make a dying animation or something alike
func die():
	queue_free(); 
