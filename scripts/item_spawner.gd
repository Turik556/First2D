extends Node
@export var Items: Array[PackedScene] =[]
var rng = RandomNumberGenerator.new()
@export var toggle_random:bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func spawn_item(mob_location):
	
	var item = Items.pick_random().instantiate()
	var item_location = mob_location
	item.position = item_location
	add_child(item)
	pass	

func initialize():
	pass

func _on_enemy_handler_s_died(mob) -> void:
	if toggle_random:
		var random_number = rng.randf_range(0.0,9.0)
		#print(random_number)
		if random_number < 1.5:
			spawn_item(mob.position)
	else:
			spawn_item(mob.position)	
	pass # Replace with function body.
