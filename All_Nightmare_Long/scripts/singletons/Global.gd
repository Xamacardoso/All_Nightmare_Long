extends Node

var transitionScene
var player: BasePlayer
var playerHasBoomerang: bool = false

var LevelSolved: int = 0
var maxLevels: int = 3
var isLevel1Solved: bool = false
var isLevel2Solved: bool = false
var isLevel3Solved: bool = false
var playerHealth = 5

func _ready():
	applyCustomMouseCursor();
	OS.window_fullscreen = false

##Set the mouse cursor image
func applyCustomMouseCursor():
	Input.set_custom_mouse_cursor(
		load("res://assets/ui/cursor/aim.png"),
		0,
		Vector2(30,30)
	);

##Change the game screen mode
func toggleFullscreenMode() -> void:
	OS.window_fullscreen = not OS.window_fullscreen;

func changeScene(targetScene: String) -> void:
	transitionScene.isSceneChanging = true
	yield(get_tree().create_timer(0.5), "timeout")
	get_tree().change_scene(targetScene)

func debugBoomerang() -> void:
	if Input.is_action_just_pressed("ui_end"):
		player.hasBoomerang = true
