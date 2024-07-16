extends Node2D

onready var camera = $Camera2D
onready var enemyGroup = $enemyGroup


func _process(delta):
	var enemies = enemyGroup.get_children().size()
	camera.offset = Vector2(rand_range(0,enemies*0.7), rand_range(0,enemies*0.7))
