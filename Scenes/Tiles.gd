extends StaticBody2D

var points = 10
onready var _target = position

var _dying = 0.0
var _dying_delta = 0.1
var _dying_color_deltat = 0.05
var _dying_rotate = 0.0
var _dying_rotate_delta = rand_range(-0.03,0.03)
var _dying_threshhold = 10

onready var t = $Timer

func _ready():
	position.y = -30
	var time = rand_range(0,2.5)
	t.set_wait_time(time)
	t.start()
	yield(t, "timeout")
	$Tween.interpolate_property(self, "position", position, _target, 2.0, Tween.TRANS_BOUNCE, Tween.EASE_OUT)
	$Tween.start()

func _process(delta):
	if _dying > 0:
		_dying += _dying_delta
		position.y += _dying

func kill():
	_dying += _dying_delta
	$CollisionShape2D.queue_free()