extends RigidBody2D

class_name Item
var item_sprite:Sprite2D
@export var icon:Sprite2D
@export var item_name:String
@export var item_probability_weight:float
var gravity:float = 0.5

func _ready() -> void:
	initialize()
	pass
func initialize():
	Global.s_game_over.connect(remove)
	Global.s_froze_start.connect(on_froze_start)
	Global.s_froze_ends.connect(on_froze_ends)
	pass	
func _process(delta: float) -> void:
	pass
func on_froze_start():
	gravity = gravity_scale
	self.gravity_scale = 0
	pass
func on_froze_ends():
	gravity_scale = 0.5
	gravity_scale = gravity
	pass
func remove():
	queue_free()
	pass
func function():
	remove()
	pass
