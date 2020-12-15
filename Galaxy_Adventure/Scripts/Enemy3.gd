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
	var fireball2 = PROJECTILE.instance();
	get_parent().add_child(fireball2);
	var fireball3 = PROJECTILE.instance();
	get_parent().add_child(fireball3);
	
	fireball.global_position = $Canon1.global_position;
	fireball2.global_position = $Canon2.global_position;
	fireball3.global_position = $Canon3.global_position;
	pass
