extends Node
signal s_score_is
signal s_start_game
signal s_game_over
signal s_change_size_s_start
signal s_change_size_b_start
signal s_change_size_s_ends
signal s_change_size_b_ends
signal s_item_work_ends
signal s_froze_start()
signal s_froze_ends
signal s_speed_up_start
signal s_speed_up_ends
signal s_add_time(value:String, time:float)
var c_velocity:Vector2
@onready var game = get_node("/root/Game")
var is_volume_on:bool
@onready var main = get_node("/root/Game/Main")
