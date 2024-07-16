extends CanvasLayer

onready var rect: TextureRect = $ColorRect
onready var material: ShaderMaterial = rect.material
var parameterValue: float = 1
var isSceneChanging: bool = false


func _ready():
	Global.transitionScene = self
	visible = true

func _process(delta):
	
	if isSceneChanging:
		transitionIn()
	else:
		transitionOut()

func transitionIn() -> void:
	rect.flip_h = false
	rect.flip_v = false
#	parameterValue = lerp(parameterValue, 1, 0.005)
	var tween = get_tree().create_tween()
	tween.tween_property(self, "parameterValue", 1.0, 0.5)
	material.set_shader_param("progress", parameterValue)

func transitionOut() -> void:
	rect.flip_h = true
	rect.flip_v = true
	var tween = get_tree().create_tween()
	tween.tween_property(self, "parameterValue", 0.0, 1)
	material.set_shader_param("progress", parameterValue)
