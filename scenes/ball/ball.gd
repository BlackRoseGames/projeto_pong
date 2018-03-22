extends RigidBody2D

export (float) var MIN_SPEED # minimum speed range
export (float) var MAX_SPEED # maximum speed range
var velocity = 400
var canMove = false
var direction = Vector2()
var initial_position = Vector2(640, 360)
var reset = false

func _ready():
	randomize()
	direction = Vector2(rand_range(-1,1),rand_range(0,1))
	
func _process(delta):
	if canMove:
		linear_velocity = direction*velocity
		canMove = false

func _on_Ball_body_entered(body):
	var name = body.get_name()
	if name == "left" or name == "right":
		linear_velocity *= 1.025

func _integrate_forces(state):
	if reset:
		randomize()
		state.transform = Transform2D(0, initial_position)
		direction = Vector2(rand_range(-1,1),rand_range(0,1))
		state.linear_velocity = Vector2()
		reset = false