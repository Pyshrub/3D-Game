extends CharacterBody3D

@onready var look = $look
@onready var look2 = $look2
@onready var look3 = $look3
@onready var look4 = $look4
const SPEED = 50.0
const JUMP_VELOCITY = 4.5
var state_id
var type = "Enemy"
@onready var player = get_node("/root/game/player")
var state = "patrol"
var spin = 0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var patrol_type = "loop"
var direction = 1
@onready var pathfollow = get_parent()
var enemy_max_speed = 50
var placement
var enemy = self
var gravity_direction_and_speed = -10
var up_vector3 = Vector3(0, 1, 0)
var truth
func patrol(delta):
	
	if patrol_type == "loop":
		pathfollow.progress += SPEED * delta *.1
		spin += .1
		$look.rotate_y(PI*spin)
func _physics_process(delta):
	if look.is_colliding():
		truth = look.get_collider()
		if truth.type == "Player":
			velocity.x += SPEED
	if look2.is_colliding():
		truth = look2.get_collider()
		if truth.type == "Player":
			velocity.z -= SPEED
	if look3.is_colliding():
		truth = look3.get_collider()
		if truth.type == "Player":
			velocity.x -= SPEED
	if look4.is_colliding():
		truth = look4.get_collider()
		if truth.type == "Player":
			velocity.z += SPEED
	move_and_slide()



func _on_area_3d_body_entered(body):
	if body.type == "Player":
		body.die()
		Global.cause_of_death = "Enemy"
	else:
		pass
