extends Node2D

onready var menuCamera = $Camera2D;
onready var mainMenu = $mainMenu;
onready var settingsMenu = $settingsMenu;
var targetMenu: Control
onready var newGameButton = $mainMenu/buttons/newGameButton
onready var backButton = $settingsMenu/buttons/backButton
onready var settingsButton = $mainMenu/buttons/settingsButton

func _ready():
	menuCamera.current; #Make the camera as current
	targetMenu = mainMenu; #Set the camera position to main menu position
	setFocusedButton(newGameButton);

func _process(delta):
	setSelectedMenu();

#Sets the camera position based on the target menu
func setSelectedMenu() -> void:
	var selectedMenuPosition = targetMenu.rect_global_position;
	menuCamera.global_position = lerp(menuCamera.global_position, selectedMenuPosition, 0.05);

##Sets the target menu as settings menu
func _on_settingsButton_pressed():
	targetMenu = settingsMenu;
	setFocusedButton(backButton);

##Sets the target menu as main menu
func _on_backButton_pressed():
	targetMenu = mainMenu;
	setFocusedButton(settingsButton);

##Exit of the game
func _on_exitButton_pressed():
	get_tree().quit();

##Sets the focused button
func setFocusedButton(button: Button) -> void:
	button.grab_focus();

##Change the fullscreen mode when button is clicked
func _on_fullscreenButton_pressed():
	Global.toggleFullscreenMode();

func _on_newGameButton_pressed():
	Global.changeScene("res://scenes/maps/Home.tscn")
