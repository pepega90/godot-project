extends Control

func _ready():
	visible = false


func player_lose():
	visible = true


func _on_RestartButton_pressed():
	get_tree().reload_current_scene()



func _on_QuitGameBtn_pressed():
	get_tree().change_scene("res://Levels/Menu.tscn")
