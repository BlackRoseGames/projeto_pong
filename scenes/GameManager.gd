extends Node2D

var POINT_PLAYER_1 = 0
var POINT_PLAYER_2 = 0

func reset():
	POINT_PLAYER_1 = 0
	POINT_PLAYER_2 = 0

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and !$Ball.canMove:
		$Ball.canMove = true

func goal(player):
	if (player == 1):
		POINT_PLAYER_1 += 1
		$Player1.text = str(POINT_PLAYER_1)
	elif (player == 2):
		POINT_PLAYER_2 += 1
		$Player2.text = str(POINT_PLAYER_2)
	$Ball.reset = true