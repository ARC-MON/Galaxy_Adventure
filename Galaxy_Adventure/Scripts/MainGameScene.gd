extends Node2D

var score = 0;

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass

func set_score(new):
	score+=new;
	get_node("CanvasLayer/Label").text = "Score: "+str(score);
	pass
func lives(hp):
	
	match hp:
		4:
			get_node("CanvasLayer/TextureRect").texture = load("res://Textures/Lives 3.png");
		3:
			get_node("CanvasLayer/TextureRect").texture = load("res://Textures/Lives 2.png");
		2:
			get_node("CanvasLayer/TextureRect").texture = load("res://Textures/Lives 1.png");
		1:
			get_node("CanvasLayer/TextureRect").texture = load("res://Textures/Lives 0.png");
	
	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/MainGameScene.tscn");
	pass


func _on_Button2_pressed():
	get_tree().change_scene("res://Scenes/TitleScreen.tscn");
	pass
