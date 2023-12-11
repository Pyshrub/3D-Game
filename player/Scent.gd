extends Node3D
var id
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_scent_timeout():
	Global.scent_trail.erase(id)
	queue_free()
