extends Control

func _ready():
	start()

func _on_Timer_timeout():
	queue_free()

func start():
	$Timer.start()

