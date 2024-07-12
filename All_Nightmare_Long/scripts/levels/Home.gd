extends Node2D

onready var player = $Player
onready var sonBedroom = $Canvas/hiddenAreas/hiddenArea2
onready var camera = $Player/Camera2D
var isPlayerOnBedroom: bool = false


func _on_Boomerang_body_entered(body):
	if body is BasePlayer:
		Global.playerHasBoomerang = true;
		$CollectableBoomerang.queue_free();

func _process(delta):
	##DEBUG
	if Input.is_action_just_pressed("ui_end"):
		Global.changeScene("res://scenes/levels/Level1.tscn")
	
	
	if isPlayerOnBedroom:
		camera.zoom = lerp(camera.zoom, Vector2(0.5,0.5), 0.005)
	else:
		camera.zoom = lerp(camera.zoom, Vector2(1,1), 0.005)

func _on_hiddenArea2_body_entered(body):
	if body is BasePlayer:
		isPlayerOnBedroom = true

func _on_hiddenArea2_body_exited(body):
	if body is BasePlayer:
		isPlayerOnBedroom = false
