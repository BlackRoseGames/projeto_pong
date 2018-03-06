extends Area2D

export var BALL_SPEED = 400
export var SPEED_MOD = 1.1
export var MAX_SPEED = 1000
var direction = Vector2(-1, 0)
var speed = BALL_SPEED

onready var initial_pos = self.position

func reset():
	position = initial_pos
	speed = BALL_SPEED
	direction = Vector2(-1, 0)

func _process(delta):
	if (speed > MAX_SPEED):
		speed = MAX_SPEED
	position += direction * speed * delta

func _faster(area):
	speed *= SPEED_MOD
