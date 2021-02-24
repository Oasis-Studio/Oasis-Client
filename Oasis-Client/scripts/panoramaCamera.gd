extends Camera

# How much to rotate per frame
var speed = 0.0002

var rot = 0

func _process(delta):
	set_rotation(Vector3(0, rot, 0))
	rot -= speed
	if rot == -360:
		rot = 0
