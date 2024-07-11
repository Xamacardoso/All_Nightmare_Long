extends KinematicBody2D
class_name BaseEnemy
var player : KinematicBody2D = null;

export var health = 10
export var speed = 100
export var damage = 5
var velocity

func _ready():
	player = get_node("../Player");

func _physics_process(_delta):
	move()

func move():
	player = get_node("../Player");
	
	if player:
		velocity = global_position.direction_to(player.global_position); # gets the vector to the player position
		move_and_slide(velocity*speed); # moves 
	
## Dies when hp reaches 0, TODO: make a dying animation or something alike
func die():
	queue_free(); 
