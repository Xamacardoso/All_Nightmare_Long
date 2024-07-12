extends KinematicBody2D
onready var player = get_parent().get_node("Player");

export var velocity = 600;
export var throw_range = 300;
onready var damage = player.damage
var bounces := 1
var throwing : bool;
var shoot_position;

func _ready():
	shoot_position = self.global_position; # position where player shot
	throwing = true; # the boomerang is being thrown, flying in the air
	

func _physics_process(_delta):
	if (throwing and bounces>0): # when boomerang is going
		move_and_slide(player.shooting_direction.normalized() * velocity);
		if (self.global_position-shoot_position).length() >= throw_range: # if the boomerang reaches limit range
			throwing=false;
		rotate(6.9) # rotates clockwise
	else: # when boomerang is returning
		rotate(-7) # rotates counter-clockwise
		var _vector_to_player = player.global_position - self.global_position # gets the vector between itself and the player
		move_and_slide((player.global_position - self.global_position).normalized() * (velocity + 200));
		if _vector_to_player.length() < 30: # when boomerang gets close enough
			player.is_firing = false;
			queue_free(); # vanishes the boomerang projectile

## When boomerang hits something
func _on_HitBoxComponent_area_entered(area):
	bounces = 0


func _on_Area2D_body_entered(body):
	if body == player:
		player.is_firing = false
		queue_free()
