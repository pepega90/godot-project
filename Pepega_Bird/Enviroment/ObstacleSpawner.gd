extends Node2D

onready var timer = $Timer

var obstacle = preload("res://Enviroment/Obstacle.tscn")

func _ready():
	randomize()

func _on_Timer_timeout():
	spawn_obstacle()

func spawn_obstacle():
	var new_obstacle = obstacle.instance()
	add_child(new_obstacle)
	new_obstacle.position.y = randi() % 400 + 150	

func start():
	timer.start()
	
func stop():
	timer.stop()


