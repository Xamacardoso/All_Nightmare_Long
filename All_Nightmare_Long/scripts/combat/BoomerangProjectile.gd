extends KinematicBody2D
onready var pivot : Position2D = $Pivot;
onready var player = get_parent().get_node("DummyPlayer");

export var velocity = 600;
export var throw_range = 300;
var throwing;
var shoot_position;

func _ready():
	shoot_position= self.global_position;
	throwing = true;
	print(player);
	print(player.shooting_direction.normalized());
	
## TODO fazer o bumerangue ir ou voltar
func _physics_process(_delta):
	pivot.global_position = player.position;
	if throwing:
		move_and_slide(player.shooting_direction.normalized() * velocity);
		if (self.global_position-shoot_position).length() >= throw_range:
			throwing=false;
	else:
		var _vector_to_player = player.global_position - self.global_position
		move_and_slide((player.global_position - self.global_position).normalized() * (velocity + 200));
		if _vector_to_player.length() < 30:
			player.is_firing = false;
			queue_free();

	
