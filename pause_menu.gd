extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_resume_button_pressed() -> void:
	Global.game.pause_game()
	get_parent().show_button(true)
	queue_free()
	pass # Replace with function body.


func _on_exit_button_pressed() -> void:
	pass # Replace with function body.
