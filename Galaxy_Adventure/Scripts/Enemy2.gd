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
