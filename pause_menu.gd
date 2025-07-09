extends Node

var volume_dict ={
	"on": preload("res://art/sound/Speaker-0.png"),
	"off":preload("res://art/sound/Speaker-Crossed.png")
}
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

func _on_exit_button_pressed() -> void:
	pass # Replace with function body.


func _on_volume_button_pressed() -> void:
	if Global.is_volume_on:
		
		$VolumeButton.texture_normal = volume_dict["off"]
		$VolumeButton.texture_hover = volume_dict["on"]
		Global.is_volume_on = false
	elif Global.is_volume_on == false:
		$VolumeButton.texture_normal = volume_dict["on"]
		$VolumeButton.texture_hover = volume_dict["off"]

func toggle_volume(value:String):
	$VolumeButton.texture_normal = volume_dict[value]
	
