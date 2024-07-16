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
#			var _tween = get_tree().create_tween();
#			_tween.tween_property(_parent, "modulate", Color(7,7,7), 0.1);
#			_tween.tween_property(_parent, "modulate", Color(1,1,1), 0.3);

