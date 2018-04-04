extends Sprite
export (float) var MAX_TIME
var upToDown = true
onready var tweenNode = get_node("Tween")
onready var imageSize = self.texture.get_size()
onready var screenSize = Vector2(1280, 720)
onready var finalSizeY = imageSize.y-screenSize.y
var startPosition = 1
var finalPosition = 0


func _ready():
	_tween_completed()

func _tween_completed():
	print()
	if startPosition == 0:
		finalPosition = 0
		startPosition = finalSizeY
	else:
		finalPosition = finalSizeY
		startPosition = 0
	tweenNode.interpolate_property(self, "region_rect:position:y", startPosition, finalPosition, MAX_TIME, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0);
	tweenNode.start()