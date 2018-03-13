extends Area2D
export var ball_dir = 1

export var MOVE_SPEED = 100

func _process(delta):
	var which = get_name()
	
	# move up and down based on input
	if Input.is_action_pressed(which+"_move_up") and position.y > 0:
		position.y -= MOVE_SPEED * delta
	if Input.is_action_pressed(which+"_move_down") and position.y < get_viewport_rect().size.y:
		position.y += MOVE_SPEED * delta

func _on_area_entered( area ):
	if area.get_name() == "ball":
		area.direction = Vector2(ball_dir, area.direction.y).normalized()


func _on_left_area_entered(area):
	pass # replace with function body
