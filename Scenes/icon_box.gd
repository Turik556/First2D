extends BoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func set_icon(value):
	$TextureRect.texture = value
	pass

func is_icon_set() -> bool:
	if $TextureRect.texture != null:
		return true 
	else:
		return false	
	pass

func get_icon() -> Texture:
	return $TextureRect.texture
