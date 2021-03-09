extends Control

#todo 
# bikin level 10 atau 20


func _on_PlayButton_pressed():
	get_tree().change_scene("res://Levels/Level_Permainan/Level1.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_AboutButton_pressed():
	get_tree().change_scene("res://Interface/About.tscn")
