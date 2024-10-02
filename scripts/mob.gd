extends RigidBody2D

@export var mob_scene:PackedScene
@onready var handler = get_parent()
signal died(value)
@export var velocity:Vector2
var acceleration:float = 2
var direction:float
var spawn_pos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initialize()
	movement()
	pass # Replace with function body.

func on_froze_start():
	print("check")
	velocity = self.linear_velocity
	linear_velocity = Vector2(0,0)
	pass
func on_speed_up_start():
	velocity = linear_velocity
	linear_velocity *=acceleration
	pass
func on_item_effect_ends():
	linear_velocity = velocity.rotated(direction)
	pass
func _process(delta: float) -> void:
	pass

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	pass # Replace with function body.

func _on_button_pressed() -> void:
	
	$CPUParticles2D.emitting=true
	died.emit(self)
	$AnimatedSprite2D.hide()
	$CollisionShape2D.set_deferred("disabled",true) 
	
	$Button.hide()
	
	pass # Replace with function body.

func _on_cpu_particles_2d_finished() -> void:
	queue_free()
	pass # Replace with function body.

func die():
	queue_free()
	pass

func initialize():
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])
	Global.s_game_over.connect(die)
	Global.s_froze_start.connect(on_froze_start)
	Global.s_froze_ends.connect(on_item_effect_ends)
	Global.s_speed_up.connect(on_speed_up_start)
	Global.s_speed_up_ends.connect(on_item_effect_ends)
	spawn_pos = handler.get_spawn_location() 
	pass

func movement():
	direction = spawn_pos.rotation + PI / 2
	position = spawn_pos.position
	direction += randf_range(-PI / 4, PI / 4)
	rotation = direction
	# Choose the velocity for the mob.
	velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	linear_velocity = velocity.rotated(direction)
	pass
