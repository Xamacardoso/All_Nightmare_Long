extends Node2D

onready var menuCamera = $Camera2D;
onready var mainMenu = $mainMenu;
onready var settingsMenu = $settingsMenu;
var selectedMenuIndex: int = 0;
var menus: Array = [];


func _ready():
	menuCamera.current; #Make the camera as current
	menuCamera.global_position = Vector2.ZERO; #Set the camera position to main menu position
	createMenusArray();

func _process(delta):
	setSelectedMenu();

##Add the control menus to an array
func createMenusArray() -> void:
	for child in get_children():
		if child is Control:
			menus.append(child);

#Sets the camera position based on the selected menu
func setSelectedMenu() -> void:
	var selectedMenu = menus[selectedMenuIndex];
	var selectedMenuPosition = selectedMenu.rect_global_position;
	menuCamera.global_position = lerp(menuCamera.global_position, selectedMenuPosition, 0.05);

func changeSelectedIndex() -> void:
	selectedMenuIndex += 1;
	if selectedMenuIndex > (menus.size() - 1):
		selectedMenuIndex = 0;

func _on_settingsButton_pressed():
	changeSelectedIndex()

func _on_backButton_pressed():
	changeSelectedIndex()

func _on_exitButton_pressed():
	get_tree().quit()
