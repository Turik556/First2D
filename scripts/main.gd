extends Node

@export var player_scene:PackedScene
@export var item_scene: PackedScene

var score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func game_over() -> void:
	$HUD.show_game_over()
	Global.s_game_over.emit()
	pass # Replace with function body.

func new_game():
	score=0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$HUD/MessageTimer.start()
	Global.s_start_game.emit()
	pass

func spawn_item(mob_location):
	var item = item_scene.instantiate()
	var item_location = mob_location
	item.position = item_location
	add_child(item)
	pass	
func update_score(value):
	score+=1
	$HUD.update_score(score)
	pass
func _on_start_timer_timeout() -> void:
	Global.s_start_game.emit
	pass # Replace with function body.
func _on_enemy_handler_s_died(mob) -> void:
	update_score(1)
	spawn_item(mob.position)
	pass # Replace with function body.
