extends Area2D


func _ready():
	$AnimationPlayer.play("hide")

func _on_hiddenArea_body_entered(body):
	if body is BasePlayer:
		$AnimationPlayer.play("show")

func _on_hiddenArea_body_exited(body):
	if body is BasePlayer:
		$AnimationPlayer.play("hide")
