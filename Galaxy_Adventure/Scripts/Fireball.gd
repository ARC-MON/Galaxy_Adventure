extends Area2D

const speed = 100;
var velocity = Vector2();
var direction = -1;

func _physics_process(delta):
	velocity.y = speed * delta * direction;
	translate(velocity);
	pass

func _on_VisibilityNotifier2D_screen_exited():
	#print("Papa friendly fireball");
	queue_free();
	pass
