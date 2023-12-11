extends CharacterBody3D

const scent_scene = preload("res://player/Scent.tscn")
const type = "Player"
const SPEED = 20.0
const JUMP_VELOCITY = 4.5
const Max_Speed = 80
const MOUSE_SENSITIVITY = 0.001
const MOUSE_RANGE = 2.4
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var rotate_left = false
var rotate_right = false
var rotate_back = false
var rotate_forward = true
var scent_trail = []
var Effects
const Balloon = preload("res://Dialogue/balloon.tscn")
var played = false
var bound = true
func release():
	bound = false
func _unhandled_input(event):
	if event.is_action_pressed("dialogue") and not played:
		$Pivot/Cam/space.hide()
		var balloon = Balloon.instantiate()
		get_tree().current_scene.add_child(balloon)
		balloon.start(load("res://Dialogue/Dialogue.dialogue"), "main")
		played = true
func _physics_process(delta):
	get_input()
	velocity.y -= gravity * delta
	var current_speed = velocity.length()
	if current_speed > Max_Speed:
		velocity = velocity.normalized() * Max_Speed
	move_and_slide()
func get_input():
	if Input.is_action_pressed("forward") and not bound:
		if rotate_left == true:
			velocity.x += SPEED
		elif rotate_right == true:
			velocity.x -= SPEED
		elif rotate_back == true:
			velocity.z -= SPEED
		else:
			velocity.z += SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	if Input.is_action_just_pressed("left"):
		self.rotate_y(-PI*1.5)
		if rotate_left == true:
			rotate_back = true
			rotate_left = false
		elif rotate_right == true:
			rotate_forward = true
			rotate_right = false
		elif rotate_back == true:
			rotate_right = true
			rotate_back = false
		else:
			rotate_left = true
	if Input.is_action_just_pressed("right"):
		self.rotate_y(PI*1.5)
		if rotate_left == true:
			rotate_forward = true
			rotate_left = false
		elif rotate_right == true:
			rotate_back = true
			rotate_right = false
		elif rotate_back == true:
			rotate_left = true
			rotate_back = false
		else:
			rotate_right = true

func add_scent():
	Effects = get_node_or_null("/root/game/Scent_Container")
	if Effects != null:	
		var scent = scent_scene.instantiate()
		scent.position = self.position
		print("yo")
		Effects.add_child(scent)
		scent_trail.append(scent)
func _on_scent_timer_timeout():
	add_scent()
func die():
	get_tree().change_scene_to_file("res://End_Screen.tscn")
