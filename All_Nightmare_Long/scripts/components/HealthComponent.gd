extends Node2D
class_name HealthComponent

export var MAX_HEALTH := 10;
var health: int;

func _ready():
	health = MAX_HEALTH;
	
	
## Takes damage
func take_damage(attack: Attack):
	health -= attack.attack_damage;
	if health <= 0:
		var _grandparent = (get_parent()).get_parent();
		if _grandparent.has_method("die"):
			_grandparent.die();
	
	
