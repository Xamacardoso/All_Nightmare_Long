extends Node2D

onready var camera = $Camera2D
onready var level1Portal = $Portals/Level1Portal
onready var level2Portal = $Portals/Level2Portal
onready var level3Portal = $Portals/Level3Portal
onready var letterCanvas = $LetterCanvas
onready var son = $Son


func _ready():
	if Global.LevelSolved == Global.maxLevels:
		son.show()
		son.monitoring = true
	else:
		son.hide()
		son.monitoring = false

func _process(delta):
	var offset = rand_range(0,0.6)
	camera.offset = Vector2(offset,offset)
	checkSolvedLevels()

func _on_Level1Portal_body_entered(body):
	if body is BasePlayer:
		Global.isLevel1Solved = true

func _on_Level2Portal_body_entered(body):
	if body is BasePlayer:
		Global.isLevel2Solved = true

func _on_Level3Portal_body_entered(body):
	if body is BasePlayer:
		Global.isLevel3Solved = true

func checkSolvedLevels() -> void:
	if Global.isLevel1Solved:
		level1Portal.monitoring = false
		level1Portal.hide()
	else:
		level1Portal.monitoring = true
	
	if Global.isLevel2Solved:
		level2Portal.monitoring = false
		level2Portal.hide()
	else:
		level2Portal.monitoring = true
	
	if Global.isLevel3Solved:
		level3Portal.monitoring = false
		level3Portal.hide()
	else:
		level3Portal.monitoring = true

func _on_HomePortal_body_entered(body):
	if body is BasePlayer:
		if Global.LevelSolved == Global.maxLevels:
			Global.changeScene("res://scenes/maps/Home.tscn")
		else:
			letterCanvas.ShowLetter()

func _on_Son_body_entered(body):
	Global.changeScene("res://scenes/menus/Credits.tscn")
