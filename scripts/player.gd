extends Area2D
signal hit

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	change_size("initial")
	screen_size = get_viewport_rect().size
	$Shield.disable()
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
		$AnimatedSprite2D.flip_h = velocity.x < 0
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.has_meta("type"):
		var body_type = body.get_meta("type")
		if body_type =="enemy":
			die();
		elif body_type == "Item":
			$ItemQueue.add_to_interact_queue(body)
			interact_with_item(body)#some code
	pass	

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	$AnimatedSprite2D.show()

func _on_cpu_particles_2d_finished() -> void:
	pass # Replace with function body.

func die():
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)
	$AnimatedSprite2D.visible=false
	$CPUParticles2D.emitting=true
	pass	
		
func interact_with_item(body:Item):	
	if body.item_name == null:
		return
	elif body.item_name == "smaller":
		$ItemQueue/ChangeSizeTimer.start()
		change_size("smaller")
	elif body.item_name == "bigger":
		$ItemQueue/ChangeSizeTimer.start()
		change_size("bigger")
	elif body.item_name == "shield":
		$Shield.enable()
		
		
	$ItemQueue.add_to_interact_queue(body)
	body.function()
	pass

func change_size(value:String):
	var _scale = self.transform.get_scale()
	if value ==  "smaller":
		scale =_scale*0.5
	if value ==  "bigger":
		scale =_scale*2
	if value == "initial":
		scale =Vector2(1,1)	
	pass
