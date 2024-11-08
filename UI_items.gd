extends HBoxContainer

class_name UI_item
var Item_box:PackedScene = preload("res://Scenes/icon_box.tscn")
var icons = []
var icons_dict = { 
	"froze": preload("res://art/items/snowflake_48.png"),
	"speed_up" : preload("res://art/items/icons/skull_01b.png"),
	"shield" : preload("res://art/items/icons/shield.png"),
	"smaller" : preload("res://art/items/icons/potion_03b.png"),
	"bigger" : preload("res://art/items/icons/potion_03a.png"),
	"null": null
}
var item_active_time_dict = {
	"froze":1.5,
	"speed_up" : 3,
	"smaller" : 4,
	"bigger" : 3
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initialize()
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_icons():
	for child in self.get_children():
		icons.append(child) 
	pass

func spawn_icon_box(value):
	for i in icons:
		if i.is_icon_set():
			pass
		else:
			i.set_icon(icons_dict[value])
			i.set_bar_max_value(item_active_time_dict[value])
			i.toggle_pbar(true)
			break	
	pass
func remove_icon(value):
	for i in icons:
		if i.is_icon_set():
			if i.get_icon() == value:
				i.set_icon(null)
				i.set_bar_max_value(0)
				i.toggle_pbar(false)
				break
	pass

func show_UI():
	
	pass

func initialize():
	#Global.s_game_over.connect()
	Global.s_froze_start.connect(_froze_start)
	Global.s_froze_ends.connect(_froze_ends)
	Global.s_speed_up_start.connect(_speed_up_start)
	Global.s_speed_up_ends.connect(_speed_up_end)
	Global.s_change_size_s_start.connect(_smaller_start)
	Global.s_change_size_s_ends.connect(_smaller_end)
	Global.s_change_size_b_start.connect(_bigger_start)
	Global.s_change_size_b_ends.connect(_bigger_end)
	get_icons()
	pass

func _froze_start():
	spawn_icon_box("froze")
	
	pass
func _froze_ends():
	remove_icon(icons_dict["froze"])
	pass	
func _speed_up_start():
	spawn_icon_box("speed_up")
	pass
func _speed_up_end():
	remove_icon(icons_dict["speed_up"])
	pass
func _smaller_start():
	spawn_icon_box("smaller")
	pass
func _smaller_end():
	remove_icon(icons_dict["smaller"])
	pass
func _bigger_start():
	spawn_icon_box("bigger")
	pass	
func _bigger_end():
	remove_icon(icons_dict["bigger"])
	pass
func _shield_start():
	spawn_icon_box("shield")
	pass	
