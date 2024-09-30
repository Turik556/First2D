extends Node
@export var mob_scene: PackedScene
var i=0
signal s_died
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.s_start_game.connect(start_game)
	Global.s_game_over.connect(end_game)
	Global.s_froze.connect(on_froze_start)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

func _on_mob_timer_timeout() -> void:
	var mob = mob_scene.instantiate()
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio =randf()
	
	var direction = mob_spawn_location.rotation + PI / 2

	# Set the mob's position to a random location.
	mob.position = mob_spawn_location.position

	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction

	# Choose the velocity for the mob.
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	add_child(mob)
	mob.died.connect(on_mob_died)
	
	pass

func on_mob_died(mob):
	s_died.emit(mob)
	pass

func start_game():
	$MobTimer.start()
	i=0
	pass

func end_game():
	$MobTimer.stop()
	pass
func on_froze_start():
	pass
