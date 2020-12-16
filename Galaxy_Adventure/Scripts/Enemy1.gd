extends Area2D

export (int) var speed = 50;
var velocity = Vector2(0,1);

func _physics_process(delta):
	
	velocity.y = speed * delta;
	translate(velocity);
	
	pass


func _on_Enemy_area_entered(area):
	if area.name != "Hitbox":
		area.queue_free();
		get_parent().get_parent().set_score(100);
		queue_free();
	pass


func _on_VisibilityNotifier2D_screen_exited():
	#print("Bye 1");
	queue_free();
	pass
