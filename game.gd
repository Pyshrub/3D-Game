extends Node3D

var played = false

const Balloon = preload("res://Dialogue/balloon.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("pause"):
		get_tree().paused = true
		$Pause_Menu.show()

func _on_timer_timeout():
	Global.update_time(1)




