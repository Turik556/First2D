extends BoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	toggle_pbar(false)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func set_icon(value):
	$TextureProgressBar/TextureRect.texture = value
	pass

func is_icon_set() -> bool:
	if $TextureProgressBar/TextureRect.texture != null:
		return true 
	else:
		return false	
	pass

func get_icon() -> Texture:
	return $TextureProgressBar/TextureRect.texture

func set_bar_max_value(max):
	$TextureProgressBar.value = 0
	$TextureProgressBar.max_value = max
	pass
func _physics_process(delta: float) -> void:
	$TextureProgressBar.value += delta
	pass
func toggle_pbar(value):
	if value == true:
		$TextureProgressBar.show()	
	else:	
		$TextureProgressBar.hide()
 
