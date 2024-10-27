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

func initialize():
	Global.s_game_over.connect()
	Global.s_froze_start.connect()
	Global.s_froze_ends.connect()
	Global.s_speed_up_start.connect()
	Global.s_speed_up_ends.connect()
	Global.s_change_size_s_start.connect()
	Global.s_change_size_s_ends.connect()
	Global.s_change_size_b_start.connect()
	Global.s_change_size_b_ends.connect()
	pass
