extends Control

func _process(delta):
	if Input.is_action_pressed("restart"):
		get_tree().change_scene("res://Levels/Level1.tscn")

