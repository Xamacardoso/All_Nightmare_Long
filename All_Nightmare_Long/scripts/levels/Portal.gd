extends Area2D


export var targetScene: String

func _on_Portal_body_entered(body):
	if body is BasePlayer:
		Global.changeScene(targetScene)
