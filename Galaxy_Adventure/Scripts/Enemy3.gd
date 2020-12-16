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
	fireball.global_position = $Canon1.global_position;
	
	var fireball2 = PROJECTILE.instance();
	get_parent().add_child(fireball2);
	fireball2.projectile_diredction(Vector2(1,1))
	fireball2.global_position = $Canon2.global_position;
	
	var fireball3 = PROJECTILE.instance();
	get_parent().add_child(fireball3);
	fireball3.projectile_diredction(Vector2(-1,1))
	fireball3.global_position = $Canon3.global_position;
	
	pass


func _on_Enemy_area_entered(area):
	if area.name != "Hitbox":
		area.queue_free();
		get_parent().get_parent().set_score(300);
		queue_free();
	pass


func _on_VisibilityNotifier2D_screen_exited():
	#print("Bye 3");
	queue_free();
	pass
	
