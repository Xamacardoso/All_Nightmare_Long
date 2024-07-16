extends Area2D


func _on_LevelPortal_body_entered(body):
	if body is BasePlayer:
		if $"../enemyGroup".get_children().size() == 0:
			Global.changeScene("res://scenes/maps/Closet.tscn")
			Global.LevelSolved += 1
		else:
			$"../Canvas/LetterCanvas".ShowLetter()
