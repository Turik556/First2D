extends Area2D
var is_able:bool = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node) -> void:
	if body.get_meta("type") == "enemy":
		body.die()
		disable()
	pass # Replace with function body.
 
func disable():
	if is_able == true:
		visible = false		
		set_deferred("monitoring", false)
		is_able = false
	pass
func enable():
	if is_able == true:
		pass
	else:
		monitoring = true
		visible = true
		is_able = true 
		
	pass	
