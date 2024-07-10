extends CanvasLayer

var buttons: Array = []
var menus: Array = []
onready var settingsMenu = $settingsMenu
var isGamePaused: bool = false
onready var resumeButton = $pauseMenu/pauseButtons/resumeButton


func _ready():
	createButtonArray()
	resumeGame()
	
	settingsMenu.hide()

##Pause or resume game when cancel input is pressed
func _input(_event):
	if Input.is_action_just_pressed("ui_cancel"):
		if isGamePaused:
			resumeGame()
		else:
			pauseGame()

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
	get_tree().paused = true;
	show();
	resumeButton.grab_focus()
	isGamePaused = true;

##Set the game pause state to false
func resumeGame() -> void:
	get_tree().paused = false;
	hide()
	disableButtons();
	isGamePaused = false;

func _on_resumeButton_pressed():
	resumeGame();
