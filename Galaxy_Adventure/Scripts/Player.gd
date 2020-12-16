extends KinematicBody2D

onready var timer = $Shoot;
onready var timer2 = $Invincible;
onready var efect = $AnimationPlayer;

const PROJECTILE = preload("res:///Scenes/Fireball.tscn");

export (int) var speed = 100;

var velocity = Vector2();
var shoot = true;
var hp = 4;

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
	
	if Input.is_action_pressed("Shoot") && shoot == true:
		shoot = false;
		var fireball = PROJECTILE.instance();
		get_parent().add_child(fireball);
		fireball.global_position = $Position2D.global_position;
		timer.start();
	
	velocity = move_and_slide(velocity)


func _on_Schoot_timeout():
	shoot = true;
	pass


func _on_Hitbox_area_entered(area):
	hp-=1;
	get_parent().lives(hp);
	efect.play("Invincible");
	if hp == 0:
		queue_free();
		#get_tree().change_scene("res://Scenes/TitleScreen.tscn");
		get_parent().get_node("PopupPanel").show();
		get_node("../Enemies/Enemy_Generator/Enemy_Spawn").stop();
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);
	
	#print("Auć");
	timer2.start();
	$Hitbox.set_collision_layer_bit(4,true);
	$Hitbox.set_collision_layer_bit(0,false);
	set_collision_layer_bit(4,true);
	set_collision_layer_bit(0,false);
	pass


func _on_Invincible_timeout():
	#print("Mortal");
	$Hitbox.set_collision_layer_bit(0,true);
	$Hitbox.set_collision_layer_bit(4,false);
	set_collision_layer_bit(0,true);
	set_collision_layer_bit(4,false);
	efect.play("Reset");
	pass
