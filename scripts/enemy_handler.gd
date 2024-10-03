extends Node
class_name EnemyHandler
@export var mob_scene: PackedScene
@onready var mob_spawn_location = $MobPath/MobSpawnLocation
var i=0
signal s_died
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.s_start_game.connect(start_game)
	Global.s_game_over.connect(end_game)
	Global.s_froze_start.connect(on_froze_start)
	Global.s_froze_ends.connect(on_froze_ends)
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

func _on_mob_timer_timeout() -> void:
	spawn_enemy()
	pass

func on_mob_died(mob):
	s_died.emit(mob)
	pass

func start_game():
	$MobTimer.start()
	pass
func end_game():
	$MobTimer.stop()
	pass
func on_froze_start():
	$MobTimer.stop()
	pass
func on_froze_ends():
	$MobTimer.start()
	pass
func get_spawn_location():
	var location = $MobPath/MobSpawnLocation
	return location

func spawn_enemy():
	var mob = mob_scene.instantiate()
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio =randf()
	
	add_child(mob)
	mob.died.connect(on_mob_died)
	pass
