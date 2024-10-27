extends HBoxContainer

class_name UI_item
var icons_dict = { 
	"froze": preload("res://art/items/snowflake.png"),
	"speed_up" : preload("res://art/items/icons/skull_01b.png"),
	"shield" : preload("res://art/items/icons/shield.png"),
	"smaller" : preload("res://art/items/icons/potion_03b.png"),
	"bigger" : preload("res://art/items/icons/potion_03a.png")
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_texture(value):
	$BoxContainer/TextureRect.texture = icons_dict[value]
	pass
