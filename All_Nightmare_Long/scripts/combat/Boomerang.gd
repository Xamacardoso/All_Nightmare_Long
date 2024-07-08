extends Area2D

onready var pivot = $Pivot;
onready var player = get_node("../");
onready var distance_to_player = self.global_position - player.global_position

var is_firing;
var shooting_direction;

func _ready():
#	print(distance_to_player)
	pass
	


func _physics_process(delta) -> void:
	if Input.is_action_just_pressed("shoot") and !is_firing:
		is_firing = true;
		shooting_direction = get_global_mouse_position();
		print(shooting_direction)
		
	if !is_firing:
		self.look_at(get_global_mouse_position()); # Olha pra a posicao do mouse
		print(shooting_direction);
	else:
		shoot_boomerang();
		

func shoot_boomerang():
	var _shoot_range = 80;
	self.global_position += shooting_direction/64;
	
