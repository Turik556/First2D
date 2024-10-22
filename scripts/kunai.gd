class_name kunai
extends enemy

var player 
var speed:float = 500
var pos
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initialize()
	$AnimationPlayer.stop()
	pos = player.get_pos()
	look_at(pos)
	rotation += PI
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity = (pos*10-position).normalized() * speed
	move_and_collide((velocity) * delta)
	pass
func _movement():
	pass

func initialize():
	player = get_node("/root/Main/Player")
	Global.s_game_over.connect(die)
	Global.s_froze_start.connect(on_froze_start)
	Global.s_froze_ends.connect(on_item_effect_ends)
	Global.s_speed_up.connect(on_speed_up_start)
	Global.s_speed_up_ends.connect(on_item_effect_ends)
	spawn_pos = handler.get_spawn_location() 
	pass
