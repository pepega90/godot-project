extends Spatial

var random_box = preload("res://Level/Rintangan.tscn")
var star = preload("res://Interface/Stars.tscn")

onready var obs = $Obstacle
onready var stars_collection = $Bintang
onready var Player = $Player



func _ready():
	randomize()
	$Timer.start()
	
func _process(delta):
	if Player.can_move == false:
		$Timer.stop()

	
func spawn_box():
	var box_instance = random_box.instance()
	box_instance.rotation_degrees = Vector3(0, rand_range(-90, 90), 0)
	box_instance.scale = Vector3(0.5, 0.5, 0.5)
	box_instance.translation = Vector3(rand_range(-1.394, 1.394), 0.58, 25 )
	obs.add_child(box_instance)


func spawn_star():
	var star_instance = star.instance()
	star_instance.scale = Vector3(0.25, 0.25, 0.25)
	star_instance.translation = Vector3(rand_range(-1.394, 1.394), rand_range(0.6, 1.5), 25)
	stars_collection.add_child(star_instance)


func _on_Timer_timeout():
	spawn_box()
	spawn_star()
