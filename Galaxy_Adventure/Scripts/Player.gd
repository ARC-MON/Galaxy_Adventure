extends KinematicBody2D

onready var timer = $Shoot;

const PROJECTILE = preload("res:///Scenes/Fireball.tscn");

export (int) var speed = 100

var velocity = Vector2()
var shoot = true;

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	
	if Input.is_action_pressed("ui_down") && shoot == true:
		shoot = false;
		var fireball = PROJECTILE.instance();
		get_parent().add_child(fireball);
		fireball.global_position = $Position2D.global_position;
		timer.start();
	
	velocity = move_and_slide(velocity)


func _on_Schoot_timeout():
	shoot = true;
	pass
