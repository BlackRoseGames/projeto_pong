extends RigidBody2D

export (float) var MAX_SPEED # maximum speed range
export (int) var MAX_KICKS
export (float) var VELOCITY_MOD
var velocity = 400
var direction = Vector2()
var initial_position = Vector2(640, 360)
var reset = false
var start = false
var canMove = true
var kicks = 0
var start_velocity_mult = 1.0
var current_velocity_mult = start_velocity_mult

func _process(delta):
	if start && canMove:
		linear_velocity = direction*velocity
		start = false
		canMove = false
	if kicks == MAX_KICKS:
		kicks = 0 
		get_parent().ballDestroy()

func _on_Ball_body_entered(body):
	var name = body.get_name()
	if name == "WallBottom" or name == "WallTop":
		kicks += 1
		get_node("Sprite").modulate = Color(1, 1-float(kicks)/float(MAX_KICKS), 1-float(kicks)/float(MAX_KICKS))
	else:
		kicks = 0
		get_node("Sprite").modulate = Color(1, 1, 1)

	if name == "left" or name == "right":
		current_velocity_mult += VELOCITY_MOD
		linear_velocity *= current_velocity_mult
		get_parent().addCombo(1)

func _integrate_forces(state):
	if reset:
		get_node("Sprite").modulate = Color(1, 1, 1)
		current_velocity_mult = start_velocity_mult
		state.transform = Transform2D(0, initial_position)
		reset = false