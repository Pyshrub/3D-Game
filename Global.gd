extends Node

var timer = 60
var points = 0
var scent_trail = []
var cause_of_death
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func reset():
	timer = 60
	points = 0
func update_time(time):
	timer -= time
	if timer <= 0:
			get_tree().change_scene_to_file("res://End_Screen.tscn")
			cause_of_death = "Out of Time"
	var hud = get_node_or_null("/root/Game/Player/Pivot/Cam")
	if hud != null:
		hud.update_time()
func update_points(score):
	points += score
	var hud = get_node_or_null("/root/Game/Player/Pivot/Cam")
	if hud != null:
		hud.update_points()

func start():
	var time = get_node_or_null("/root/Game/Timer")
	if time != null:
		time.start()
func release():
	var player = get_node_or_null("/root/Game/Player")
	if player!= null:
		player.release()
