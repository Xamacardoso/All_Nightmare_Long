extends CanvasLayer

onready var lifebar = $Life
onready var hearts = lifebar.get_children();
onready var player = get_tree().get_nodes_in_group("Player")[0];


func _ready():
	var _index = player.hurtbox.health_component.MAX_HEALTH-player.hurtbox.health_component.health
	for i in range(1,_index+1):
		if _index > 0:
			hearts[-i].modulate = Color(0,0,0);
		
	if player:
		player.hurtbox.connect("parent_damaged", self, "_update_hearts");
	
func _update_hearts(max_health, health):
	var _tween = get_tree().create_tween();
	var _index = max_health - health;
	_tween.tween_property(hearts[-_index], "modulate", Color(7,7,7), 0.1);
	_tween.tween_property(hearts[-_index], "modulate", Color(0,0,0), 0.3);

