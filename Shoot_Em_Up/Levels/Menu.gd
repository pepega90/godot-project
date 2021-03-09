extends Control


func _on_StartButton_pressed():
	get_tree().change_scene("res://Levels/Level_permainan/Level1.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_TutorialButton_pressed():
	get_tree().change_scene("res://Levels/Tutorial.tscn")


func _on_SelectLevelButton_pressed():
	get_tree().change_scene("res://Levels/LevelMenu.tscn")
