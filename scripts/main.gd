extends Node

@export var player_scene:PackedScene
@export var item_scene: PackedScene
var pos: float
var is_game_started:bool
var score:int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_scene()
	pass

func game_over() -> void:
	$HUD.show_game_over()
	Global.s_game_over.emit()
	is_game_started = false
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
	
func update_score(value):
	score+=1
	$HUD.update_score(score)
	if score % 5 == 0:
		Global.s_score_is.emit()
	pass
func _on_start_timer_timeout() -> void:
	Global.s_start_game.emit
	is_game_started = true
	pass # Replace with function body.
func _on_enemy_handler_s_died(mob) -> void:
	update_score(1)
	
	pass # Replace with function body.
func move_scene():
	pos = $TextureRect.position.y
	if is_game_started:
		if pos < 0 :
			$TextureRect.position = Vector2(0.0,1.0 + pos)	
		else:
			$TextureRect.position = Vector2(0.0,-1000.0 + pos)		
			#print("jump")
pass
