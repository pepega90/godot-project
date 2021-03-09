extends Control

func _ready():
	hide()


func _on_TextureButton_pressed():
	$Timer.start()


func _on_Timer_timeout():
	var get_current_level = int(get_tree().current_scene.name)
	if get_current_level == 10:
		get_tree().change_scene("res://Interface/WinGame.tscn")
	get_current_level += 1
	get_tree().change_scene("res://Levels/Level_Permainan/Level" + str(get_current_level) +".tscn")
