extends Area2D
class_name HitBoxComponent


func _ready():
	pass;

## Hitbox contact with an hurtbox
func _on_Area2D_area_entered(area):
	if area is HurtboxComponent:
		var _attack = Attack.new();
		_attack.attack_damage = get_parent().damage;
		area.take_damage();
