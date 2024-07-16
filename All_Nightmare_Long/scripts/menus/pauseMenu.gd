extends CanvasLayer

var buttons: Array = []
var isGamePaused: bool = false
onready var animation = $AnimationPlayer
onready var resumeButton = $pauseMenu/pauseButtons/resumeButton
onready var backButton = $settingsMenu/settingsButtons/back
onready var settingsMenu = $settingsMenu
onready var pauseMenu = $pauseMenu


func _ready():
	hide()
	createButtonArray();

func _input(_event):
	if Input.is_action_just_pressed("ui_cancel"):
		if isGamePaused:
			resumeGame();
		else:
			pauseGame();

##Add all the child buttons to the buttons array
func createButtonArray() -> void:
	for child in get_children():
		if child is Button:
			buttons.append(child);

##Disable all buttons to block miss click when game isnt paused 
func disableButtons() -> void:
	for button in buttons:
		button.disable = true;

##Set the pause game state to true
func pauseGame() -> void:
	show()
	settingsMenu.hide()
	animation.play("open")

##Set the game pause state to false
func resumeGame() -> void:
	animation.play("close")
	disableButtons();

func openSettings() -> void:
	settingsMenu.show()
	animation.play("openSettings")

func _on_resumeButton_pressed():
	resumeGame()

func _on_AnimationPlayer_animation_finished(anim_name):
	match anim_name:
		"open":
			isGamePaused = true
			resumeButton.grab_focus()
			get_tree().paused = true
		"close":
			isGamePaused = false
			hide()
			get_tree().paused = false
		"openSettings":
			backButton.grab_focus()
		"closeSettings":
			resumeButton.grab_focus()

func _on_settingsButton_pressed():
	openSettings()

func _on_back_pressed():
	animation.play("closeSettings")

func _on_fullscreen_pressed():
	Global.toggleFullscreenMode()
