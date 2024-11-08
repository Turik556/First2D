extends Node
@onready var player = get_parent()
var queue =[]
var froze_time: int = 1
var speed_up_time: int = 3
var is_frozed = false
var is_speed_up = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.s_froze_start.connect(on_froze_start)
	Global.s_speed_up_start.connect(on_speed_up_start)

# Called every frame. 'delta' is the eladpsed time since the previous frame
func on_froze_start():
	$FrozeTimer.wait_time = 2
	$FrozeTimer.start()
	is_frozed = true 
	
func add_to_interact_queue(item):
	queue.append(item)
	
func on_speed_up_start():
	$AccelerationTime.start(speed_up_time)

func _on_acceleration_time_timeout() -> void:
	Global.s_speed_up_ends.emit()

func on_froze_timer_timeout() -> void:
	Global.s_froze_ends.emit()
	is_frozed = false

func start_timer(value:String):
	match value:
		"ChangeSizeToSmallerTimer":
			$ChangeSizeToSmallTimer.start()
			Global.s_change_size_s_start.emit()
		"ChangeSizeToBiggerTimer":
			$ChangeSizeToBiggerTimer.start()	
			Global.s_change_size_b_start.emit()
		"AccelerationTimer":
			$AccelerationTime.start()
			Global.s_speed_up_start.emit()
		"FrozeTimer":
			$FrozeTimer.start()
			Global.s_froze_start.emit()
		"speed_up_timer":
			$AccelerationTime.start()
			Global.s_speed_up_start.emit()

func add_time(name:String, value:float):
	var _time:float
	var _name:String
	match name:
		"ChangeSizeToSmallerTimer":
			_time = $ChangeSizeToSmallTimer.time_left + value
			_name = "smaller"
			$ChangeSizeToSmallTimer.start(_time)
		"ChangeSizeToBiggerTimer":
			_time = $ChangeSizeToBiggerTimer.time_left + value
			_name = "bigger"
			$ChangeSizeToBiggerTimer.start(_time)	
		"AccelerationTimer":
			_time = $AccelerationTimer.time_left + value
			_name = "speed_up"
			$AccelerationTime.start(_time)
		"FrozeTimer":
			_time = $FrozeTimer.time_left + value
			_name = "froze"
			$FrozeTimer.start(_time)
	Global.s_add_time.emit(_name,_time)

func get_queue() -> Array:
	return queue

func debug():
	print("small_time =", $ChangeSizeToSmallTimer.time_left)
	print ("accel_time =", $AccelerationTime.time_left)
	print("froze_time=", $FrozeTimer.time_left)
	print("big_time = ", $ChangeSizeToBiggerTimer.time_left)

func stop_timer(name:String):
	match name:
		"ChangeSizeToSmallTimer":
			$ChangeSizeToSmallTimer.stop()
		"ChangeSizeToBiggerTimer":
			$ChangeSizeToBiggerTimer.stop()	
		"AccelerationTimer":
			$AccelerationTime.stop()
		"FrozeTimer":
			$FrozeTimer.stop()

func _on_change_size_to_small_timer_timeout() -> void:
	player.change_size("initial")
	Global.s_change_size_s_ends.emit()

func _on_change_size_to_bigger_timer_timeout() -> void:
	player.change_size("initial")
	Global.s_change_size_b_ends.emit()
