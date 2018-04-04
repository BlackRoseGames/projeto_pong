extends Node2D

var POINT_PLAYER_1 = 0
var POINT_PLAYER_2 = 0
var COMBO = 1;

func reset():
	POINT_PLAYER_1 = 0
	POINT_PLAYER_2 = 0
	COMBO = 1
	$Player1.text = str(POINT_PLAYER_1)
	$Player2.text = str(POINT_PLAYER_2)
	$ComboText/Combo.text = str(COMBO)

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
		POINT_PLAYER_1 += COMBO
		$Player1.text = str(POINT_PLAYER_1)
	elif (player == 2):
		POINT_PLAYER_2 += COMBO
		$Player2.text = str(POINT_PLAYER_2)
	COMBO = 1
	$ComboText/Combo.text = str(COMBO)
	resetBall()

func addCombo(value):
	COMBO += value
	$ComboText/Combo.text = str(COMBO)

func ballDestroy():
	resetBall()
	reset()

func resetBall():
	$Ball.direction = randomizeDirection()
	$Ball.reset = true
	$Ball.start = false
	$Ball.canMove = true