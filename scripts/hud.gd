extends CanvasLayer

signal start_game
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
func show_message(text):
	$Message.text=text
	$Message.show()
	
	pass
func show_game_over():
	show_message("Game Over")
	$MessageTimer.start()
	await  $MessageTimer.timeout
	show_message("Dodge the Creeps!")
	$StartButton.show()
	pass
	
	
func update_score(score):
	$ScoreLabel.text = str(score)


func _on_start_button_pressed() -> void:
	$StartButton.hide()
	start_game.emit()
	pass # Replace with function body.


func _on_message_timer_timeout() -> void:
	$Message.hide()
	pass # Replace with function body.
