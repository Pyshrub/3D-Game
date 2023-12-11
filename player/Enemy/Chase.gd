# ChaseState.gd
extends Node

@onready var SM = get_parent()
@onready var enemy = get_node("../..")
@onready var player = get_node_or_null("/root/game/Player")
func _ready():
	pass
