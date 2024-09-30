extends Area2D
signal hit

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	screen_size = get_viewport_rect().size
	#hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity=Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x +=1
	if Input.is_action_pressed("move_left"):
		velocity.x -=1
	if Input.is_action_pressed("move_down"):
		velocity.y +=1
	if Input.is_action_pressed("move_up"):
		velocity.y -=1
	
	#match Input.is_action_pressed(x):
		#"move_right":
			#velocity.x +=1
		#"move_left":
			#velocity.x -=1
	if velocity.length()>0:
		velocity=velocity.normalized()*speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
	# See the note below about the following boolean assignment.
		$AnimatedSprite2D.flip_h = velocity.x < 0
	#elif velocity.y != 0:
		#$AnimatedSprite2D.animation = "up"
		#$AnimatedSprite2D.flip_v = velocity.y > 0
	pass



func _on_body_entered(body: Node2D) -> void:
	 # Player disappears after being hit.
	
	print(body.get_meta("type"))
	if body.has_method("get_type"):
		var type = body.get_type()
		if type == "Enemy":
			hit.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
			$CollisionShape2D.set_deferred("disabled", true)
			$AnimatedSprite2D.visible=false
			$CPUParticles2D.emitting=true
		elif type == "Item":
			#
			pass
	
	
	
	pass # Replace with function body.

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	$AnimatedSprite2D.show()


func _on_cpu_particles_2d_finished() -> void:
	$CPUParticles2D.queue_free()
	pass # Replace with function body.


func changeSize(value):
	if value == "bigger":
		self.scale = self.scale *2
	elif value == "smaler":
		self.scale = self.scale /2
	pass
	
