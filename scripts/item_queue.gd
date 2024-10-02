extends Node
@onready var player = get_parent()
var queue =[]
var froze_time:int = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.s_froze_start.connect(on_froze_start)
	
	pass # Replace with function body.

# Called every frame. 'delta' is the eladpsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func on_froze_start():
	$FrozeTimer.start(froze_time) 
	pass
func add_to_interact_queue(item):
	queue.append(item)
	pass
func _on_Froze_timer_timeout() -> void:
	Global.s_froze_ends.emit()
	pass # Replace with function body.

func _on_change_size_timer_timeout() -> void:
	player.change_size("initial")
	pass # Replace with function body.
