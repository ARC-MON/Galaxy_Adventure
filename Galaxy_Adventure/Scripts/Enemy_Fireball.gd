extends Area2D

const PROJECTILE = preload("res:///Scenes/Fireball.tscn");

const speed = 100;
var velocity = Vector2();
var direction = Vector2(0,1);

func projectile_diredction(a):
	direction = a;
	pass

func _physics_process(delta):
	velocity = speed * delta * direction;
	translate(velocity);
	pass


func _on_VisibilityNotifier2D_screen_exited():
	#print("Papafireball");
	queue_free();
	pass

func _on_Enemy_Fireball_body_entered(body):
	queue_free();
	pass 
