extends RigidBody2D

class_name Item
var item_sprite:Sprite2D
var item_name:String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.s_game_over.connect(remove)
	
	#тут будет решаться рандомом какой предмет будет спавниться
	
func _process(delta: float) -> void:
	pass

func remove():
	queue_free()
	pass
func function():
	Global.froze.emit()
	pass