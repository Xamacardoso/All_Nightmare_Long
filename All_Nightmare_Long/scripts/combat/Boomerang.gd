extends Area2D

onready var player = get_node("../");
onready var sprite = $Pivot/Sprite;
onready var distance_to_player = self.global_position - player.global_position;
