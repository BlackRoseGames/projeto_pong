extends RigidBody2D

export (float) var MIN_SPEED # minimum speed range
export (float) var MAX_SPEED # maximum speed range
var velocity = 400
var canMove = true
var direction = Vector2(-1,0.5)

onready var initial_pos = self.position

func reset():
	pass

func _ready():
	linear_velocity = direction*velocity

func _on_Ball_body_entered(body):
	var name = body.get_name()
	print(name)
	if name == "left" or name == "right":
		linear_velocity *= 1.025
		print(linear_velocity)
