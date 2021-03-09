extends Node2D

func _on_Area2D_body_entered(body):
	var level = int(get_tree().current_scene.name)
	if body.name == "Player":
		level += 1
		get_tree().call_group("Gamestate", "next_level", level)


# todo bikin level terakhir yaitu level 3
