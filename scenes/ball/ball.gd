extends RigidBody2D

export (float) var MIN_SPEED # minimum speed range
export (float) var MAX_SPEED # maximum speed range
var velocity = 400
var direction = Vector2()
var initial_position = Vector2(640, 360)
var reset = false
var start = false
var canMove = true

func _process(delta):
	if start && canMove:
		linear_velocity = direction*velocity
		start = false
		canMove = false

func _on_Ball_body_entered(body):
	var name = body.get_name()
	if name == "left" or name == "right":
		linear_velocity *= 1.1

func _integrate_forces(state):
	if reset:
		state.transform = Transform2D(0, initial_position)
		reset = false
