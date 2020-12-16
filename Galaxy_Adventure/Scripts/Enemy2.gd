extends Area2D

const PROJECTILE = preload("res:///Scenes/Enemy_Fireball.tscn");
onready var timer = $Shoot;

export (int) var speed = 50;
var velocity = Vector2(0,1);

func _ready():
	timer.start();
	pass

func _physics_process(delta):
	velocity.y = speed * delta;
	translate(velocity);
	pass


func _on_Shoot_timeout():
	var fireball = PROJECTILE.instance();
	get_parent().add_child(fireball);
	fireball.global_position = $Position2D.global_position;
	pass


func _on_Enemy_area_entered(area):
	if area.name != "Hitbox":
		area.queue_free();
		get_parent().get_parent().set_score(200);
		queue_free();
	pass


func _on_VisibilityNotifier2D_screen_exited():
	#print("Bye 2");
	queue_free();
	pass
