extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$cause.text = str(Global.cause_of_death)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	Global.reset()
	get_tree().change_scene_to_file("res://game.tscn")


func _on_button_2_pressed():
	get_tree().quit()
