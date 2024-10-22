extends Node

var _paused:bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"): 
		if _paused == false:
			get_tree().paused = true
			_paused = true
		else:
			get_tree().paused = false
			_paused = false
	pass
	pass
