extends Area2D
class_name HurtboxComponent

onready var health_component = get_node("HealthComponent");

func _ready():
	pass

func take_damage(attack: Attack):
	if health_component:
		health_component.take_damage(attack);
