class_name kunai
extends enemy

var player 
var pos
var _velocity:Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initialize()
	pass # Replace with function body

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	move_and_collide(velocity * delta)
	pass

func initialize():
	$AnimationPlayer.stop()
	player = get_node("/root/Game/Main/Player")
	Global.s_game_over.connect(die)
	Global.s_froze_start.connect(on_froze_start)
	Global.s_froze_ends.connect(on_item_effect_ends)
	Global.s_speed_up_start.connect(on_speed_up_start)
	Global.s_speed_up_ends.connect(on_item_effect_ends)
	spawn_pos = handler.get_spawn_location() 
	position = spawn_pos.position
	pos = player.get_pos() 
	velocity = (pos-position).normalized() * speed 
	look_at(pos)
	rotation += PI
	pass

func on_froze_start():
	print("check")
	_velocity = velocity
	velocity = Vector2.ZERO
	modulate = Color("#0005ff")
	pass
func on_item_effect_ends():
	velocity = _velocity
	modulate = Color("#ffffff")
	pass

func on_speed_up_start():
	_velocity = velocity
	velocity *=2
	pass
