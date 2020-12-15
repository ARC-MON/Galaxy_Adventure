extends Area2D

func _ready():
	pass

func _on_Enemy_Destroyer_area_entered(area):
	print("Exit");
	area.queue_free();
	pass 
