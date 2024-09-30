extends RigidBody2D

var itemType
enum type {fROZE}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.s_game_over.connect(on_game_over)
	#тут будет решаться рандомом какой предмет будет спавниться
	
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func on_game_over():
	queue_free()
	pass

func change_size(value):
	pass

func _on_body_entered(body: Node) -> void:
	#if itemType == "smaller"
	pass # Replace with function body.
