extends Area2D

export (int) var speed = 50;
var velocity = Vector2(0,1);

func _physics_process(delta):
	
	velocity.y = speed * delta;
	translate(velocity);
	
	pass
