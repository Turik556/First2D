extends Item

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initialize()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func function():
	Global.s_froze_start.emit()
	remove()
	pass