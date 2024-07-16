extends Node2D

onready var player = $Player
onready var sonBedroom = $Canvas/hiddenAreas/hiddenArea2
onready var camera = $Player/Camera2D
var isPlayerOnBedroom: bool = false
onready var collectableBoomerang: Area2D = $CollectableBoomerang;
onready var portal = $Portal
onready var letterCanvas = $Canvas/LetterCanvas
onready var letterArea = $LetterArea


func _on_Boomerang_body_entered(body):
	if body is BasePlayer:
		Global.playerHasBoomerang = true;
		collectableBoomerang.queue_free();

func _process(delta):
	setCameraProperties()
	
	if letterArea.overlaps_body(player):
		letterArea.monitoring = false

func _on_hiddenArea2_body_entered(body):
	if body is BasePlayer:
		isPlayerOnBedroom = true;

func _on_hiddenArea2_body_exited(body):
	if body is BasePlayer:
		isPlayerOnBedroom = false;

func setCameraProperties() -> void:
	if isPlayerOnBedroom:
		camera.zoom = lerp(camera.zoom, Vector2(0.5,0.5), 0.005);
		var _playerDistance = portal.global_position.distance_to(player.global_position)
		if _playerDistance < 150:
			var offset = ((151 - _playerDistance) / 25)
			camera.offset.x = rand_range(0, offset)
	else:
		camera.zoom = lerp(camera.zoom, Vector2(1,1), 0.005);
		camera.offset = Vector2.ZERO

func _on_Letter_body_entered(body):
	if body is BasePlayer:
		letterCanvas.ShowLetter()
		letterArea.hide()
