extends Area2D

const ENEMY1 = preload("res:///Scenes/Enemy1.tscn");
const ENEMY2 = preload("res:///Scenes/Enemy2.tscn");
const ENEMY3 = preload("res:///Scenes/Enemy3.tscn");
var rng = RandomNumberGenerator.new();

onready var timer = $Enemy_Spawn;

var r = 1;
var maxr = 10;
onready var size = $CollisionShape2D.shape.extents.x;

func _ready():
	timer.start();
	pass

func _process(delta):
	pass

func _on_Enemy_Spawn_timeout():
	
	for i in range(r):
		rng.randomize();
		var mrn = rng.randi_range(1,3);
		match mrn:
			1:
				var enemy = ENEMY1.instance();
				get_parent().add_child(enemy);
				rng.randomize();
				enemy.global_position.x = self.global_position.x+rng.randi_range(-size,size);
				enemy.global_position.y = self.global_position.y;
			2:
				rng.randomize();
				var enemy = ENEMY2.instance();
				get_parent().add_child(enemy);
				enemy.global_position.x = self.global_position.x+rng.randi_range(-size,size);
				enemy.global_position.y = self.global_position.y;
			3:
				rng.randomize();
				var enemy = ENEMY3.instance();
				get_parent().add_child(enemy);
				enemy.global_position.x = self.global_position.x+rng.randi_range(-size,size);
				enemy.global_position.y = self.global_position.y;
	if r < maxr:
		r+=1;
	pass
