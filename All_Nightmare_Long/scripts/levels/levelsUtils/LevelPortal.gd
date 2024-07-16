extends Area2D


func _process(delta):
	if $"../enemyGroup".get_children().size() == 0:
		monitoring = true
	else:
		monitoring = false

func _on_LevelPortal_body_entered(body):
	if body is BasePlayer:
		Global.changeScene("res://scenes/maps/Closet.tscn")
		Global.LevelSolved += 1
