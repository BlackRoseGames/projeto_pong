extends Node2D

var POINT_PLAYER_1 = 0
var POINT_PLAYER_2 = 0

func reset():
	POINT_PLAYER_1 = 0
	POINT_PLAYER_2 = 0

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and !$Ball.start and !$Ball.reset:
		$Ball.start = true
		$Ball.direction = randomizeDirection()

func randomizeDirection():
	randomize()
	var mulp = 1
	var mulp2 = 1
	if (randi()%2 == 0):
		mulp = -1
	if (randi()%2 == 0):
		mulp2 = -1
	return Vector2(mulp, rand_range(0.25, 0.75)*mulp2)

func goal(player):
	if (player == 1):
		POINT_PLAYER_1 += 1
		$Player1.text = str(POINT_PLAYER_1)
	elif (player == 2):
		POINT_PLAYER_2 += 1
		$Player2.text = str(POINT_PLAYER_2)
	$Ball.direction = randomizeDirection()
	$Ball.reset = true
	$Ball.start = false
	$Ball.canMove = true