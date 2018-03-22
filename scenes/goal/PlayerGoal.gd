extends Area2D

export var POINT_PLAYER = 1

func _ready():
	pass

func _on_PlayerGoal_body_entered(body):
	if body.get_name() == "Ball":
		get_tree().get_root().get_node("Game").goal(POINT_PLAYER)
		body.position = Vector2(640, 360)
		body.linear_velocity *= 0
		body.canMove = false
		body.direction = Vector2(randf()*3-2,randf()*1)
