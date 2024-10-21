class_name kunai
extends enemy

var player: PackedScene = preload("res://Scenes/Player.tscn")
var speed:float = 50
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initialize()
	_movement()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _movement():
	var pos = player.get_pos()
	velocity = position.direction_to(pos)* speed
	pass

func initialize():
	Global.s_game_over.connect(die)
	Global.s_froze_start.connect(on_froze_start)
	Global.s_froze_ends.connect(on_item_effect_ends)
	Global.s_speed_up.connect(on_speed_up_start)
	Global.s_speed_up_ends.connect(on_item_effect_ends)
	spawn_pos = handler.get_spawn_location() 
	pass
