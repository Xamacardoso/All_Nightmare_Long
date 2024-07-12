extends Node2D

onready var player = $Player
var isPlayerSpawning: bool = true

func _process(delta):
	spawnPlayer()

func _on_Boomerang_body_entered(body):
	if body is BasePlayer:
		body.hasBoomerang = true;
		$CollectableBoomerang.queue_free();

func spawnPlayer() -> void:
	if isPlayerSpawning:
		yield(get_tree().create_timer(1), "timeout")
		var playerSpawnPosition := Vector2(290,415)
		player.global_position = lerp(player.global_position, playerSpawnPosition, 0.01)
		if player.global_position == playerSpawnPosition:
			isPlayerSpawning = false
