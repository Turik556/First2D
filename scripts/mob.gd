extends RigidBody2D

@export var mob_scene:PackedScene
signal died(value)
@export var velocity:Vector2
var acceleration:float = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])
	Global.s_game_over.connect(die)
	Global.s_froze_start.connect(on_froze_start)
	Global.s_froze_ends.connect(on_item_effect_ends)
	Global.s_speed_up.connect(on_speed_up_start)
	Global.s_speed_up_ends.connect(on_item_effect_ends)
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
	linear_velocity = velocity
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
