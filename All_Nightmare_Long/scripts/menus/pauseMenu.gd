extends CanvasLayer

signal paperOpened
signal paperClosed
var buttons: Array = []
var menus: Array = []
onready var settingsMenu = $settingsMenu
var isGamePaused: bool = false
onready var resumeButton = $pauseMenu/pauseButtons/resumeButton
onready var paperRect = $paperRect
var canShowMenu: bool = false


func _ready():
	createButtonArray()
	resumeGame()
	paperRect.rect_size.y = 0
	settingsMenu.hide()
	connect("paperClosed", self, "resumeGame")

func _process(delta):
	if isGamePaused:
		paperAnimation("open")
	else:
		paperAnimation("close")

func _input(_event):
	if Input.is_action_just_pressed("ui_cancel"):
		if isGamePaused:
			resumeGame();
			paperAnimation("close")
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
	get_tree().paused = true;
	show();
	resumeButton.grab_focus();
	isGamePaused = true;

##Set the game pause state to false
func resumeGame() -> void:
	get_tree().paused = false;
	if paperRect.rect_size.y < 1:
		hide()
	disableButtons();

func _on_resumeButton_pressed():
	paperAnimation("close")

##Animate the background paper
func paperAnimation(type: String) -> void:
	match type:
		"open":
			paperRect.rect_size.y = lerp(paperRect.rect_size.y, 160, 0.05);
			if paperRect.rect_size.y > 156:
				emit_signal("paperOpened")
				set_process(false)
		"close":
			paperRect.rect_size.y = lerp(paperRect.rect_size.y, 0, 0.05);
			isGamePaused = false;
			if paperRect.rect_size.y < 1:
				emit_signal("paperClosed")
			set_process(true)
