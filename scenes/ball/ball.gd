extends RigidBody2D

export (float) var MIN_SPEED # minimum speed range
export (float) var MAX_SPEED # maximum speed range
var velocity = 300
var canMove = true
var direction = Vector2(-1,0.5)

onready var initial_pos = self.position

func reset():
	set_fixed_process(true)

func _ready():
    linear_velocity = direction*velocity
