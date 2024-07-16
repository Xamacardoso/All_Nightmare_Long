extends Node2D

onready var camera = $Camera2D
onready var level1Portal = $Portals/Level1Portal
onready var level2Portal = $Portals/Level2Portal
onready var level3Portal = $Portals/Level3Portal


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
