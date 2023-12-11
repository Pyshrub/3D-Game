extends Node3D
const scent_scene = preload("res://player/Scent.tscn")
var scent_trail = []
@onready var player = get_node("/root/Game/Player")
var scent_id = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_scent_timer_timeout():
	var scent = scent_scene.instantiate()
	scent.position = player.position
	scent.position.y += 5
	scent.id = scent_id
	add_child(scent)
	Global.scent_trail.append(scent)
	scent_id += 1
	
