extends Node

var queue =[]
var froze_time:int = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.s_froze.connect(on_froze_start)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func on_froze_start():
	$Timer.start(froze_time) 
	
	pass
func add_to_interact_queue(item):
	
	pass

func _on_timer_timeout() -> void:
	Global.s_item_work_ends.emit()
	pass # Replace with function body.
