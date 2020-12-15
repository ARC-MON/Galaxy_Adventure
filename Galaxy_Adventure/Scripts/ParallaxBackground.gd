extends ParallaxBackground

var offsetLoc = 0;

func _ready():
	pass

func _process(delta):
	offsetLoc = offsetLoc + 30 * delta;
	set_scroll_offset(Vector2(0,offsetLoc));
	pass
