extends KinematicBody2D

export (float) var MOVE_SPEED = 400
var screensize
var velocity = Vector2()

func _ready():
    screensize = get_viewport_rect().size

func _physics_process(delta):
	var which = get_name()
	velocity = Vector2()
	
	# move up and down based on input
	if Input.is_action_pressed(which+"_move_up") and position.y > 0:
		velocity.y -= 1
	if Input.is_action_pressed(which+"_move_down") and position.y < get_viewport_rect().size.y:
		velocity.y += 1
	if velocity.length() > 0:
        velocity = velocity.normalized() * MOVE_SPEED
	position += velocity * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)