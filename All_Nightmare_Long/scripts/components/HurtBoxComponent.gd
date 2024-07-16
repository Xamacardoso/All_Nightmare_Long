extends Area2D
class_name HurtboxComponent

signal parent_damaged(max_health, health)
onready var health_component = get_node("HealthComponent");


func _ready():
	pass

func take_damage(attack: Attack):
	if health_component:
		health_component.take_damage(attack);
		emit_signal("parent_damaged", health_component.MAX_HEALTH, health_component.health)
		var _parent = get_parent();
		if _parent:
			pass
#

