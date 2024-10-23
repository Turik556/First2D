extends Node
@onready var player = get_parent()
var queue =[]
var froze_time: int = 1
var speed_up_time: int = 3
var is_size_changed:bool = false
var is_frozed:bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.s_froze_start.connect(on_froze_start)
	Global.s_speed_up.connect(on_speed_up_start)
	
	pass # Replace with function body.a

# Called every frame. 'delta' is the eladpsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func on_froze_start():
	$FrozeTimer.wait_time = 2
	$FrozeTimer.start()
	is_frozed = true 
	pass
func add_to_interact_queue(item):
	queue.append(item)
	pass

func _on_change_size_timer_timeout() -> void:
	player.change_size("initial")
	is_size_changed = false
	pass 
	
func on_speed_up_start():
	$AccelerationTime.start(speed_up_time)
	pass

func _on_acceleration_time_timeout() -> void:
	Global.s_speed_up_ends.emit()
	pass # Replace with function body.


func on_froze_timer_timeout() -> void:
	Global.s_froze_ends.emit()
	is_frozed = false
	pass 

func start_timer(value:String):
	match value:
		"ChangeSizeToSmallTimer":
			$ChangeSizeToSmallTimer.start()
		"ChangeSizeToBiggerTimer":
			$ChangeSizeToBiggerTimer.start()	
		"AccelerationTimer":
			$AccelerationTime.start()
		"FrozeTimer":
			$FrozeTimer.start()
	pass
func add_time(name:String, value:float):
	match name:
		"ChangeSizeToSmallTimer":
			$ChangeSizeToSmallTimer.start($ChangeSizeToSmallTimer.time_left + value)
		"ChangeSizeToBiggerTimer":
			$ChangeSizeToBiggerTimer.start($ChangeSizeToBiggerTimer.time_left + value)	
		"AccelerationTimer":
			$AccelerationTime.start($AccelerationTime.time_left +value)
		"FrozeTimer":
			$FrozeTimer.start($FrozeTimer.time_left + value)
			print($FrozeTimer.time_left)
	pass


func get_queue() -> Array:
	return queue
	pass
