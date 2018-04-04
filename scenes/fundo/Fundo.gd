extends ParallaxBackground
export (float) var VELOCITY
onready var parallax1 = get_child(0)
onready var parallax2 = get_child(1)
onready var parallax3 = get_child(2)
onready var parallax4 = get_child(3)

var offsetLoc = 0

func _ready():
	parallax1.motion_mirroring = parallax1.get_child(0).texture.get_size()
	parallax2.motion_mirroring = parallax2.get_child(0).texture.get_size()
	parallax3.motion_mirroring = parallax3.get_child(0).texture.get_size()
	parallax4.motion_mirroring = parallax4.get_child(0).texture.get_size()

func _process(delta):
	offsetLoc = offsetLoc + VELOCITY * delta
	scroll_base_offset = Vector2(0, -offsetLoc)
	parallax2.motion_offset = Vector2(0, -(offsetLoc*1.25))
	parallax3.motion_offset = Vector2(0, -(offsetLoc*1.5))
	parallax4.motion_offset = Vector2(0, -(offsetLoc*2))