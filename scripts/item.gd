extends RigidBody2D

class_name Item
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.s_game_over.connect(remove)
	function()
	#тут будет решаться рандомом какой предмет будет спавниться
	
func _process(delta: float) -> void:
	pass

func function():
	print("parent")
	pass

func remove():
	queue_free()
	pass
