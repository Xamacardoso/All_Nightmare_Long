extends CanvasLayer

onready var animationPlayer = $AnimationPlayer
var showingLetter: bool = false

func _ready():
	hide()

func _process(delta):
	if showingLetter:
		if Input.is_action_just_pressed("ui_accept"):
			hideLetter()

func ShowLetter() -> void:
	show()
	get_tree().paused = true
	animationPlayer.play("showLetter")
	showingLetter = true

func hideLetter() -> void:
	animationPlayer.play("hideLetter")
	

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "hideLetter":
		showingLetter = false
		get_tree().paused = false
		hide()
