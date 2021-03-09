extends Control

func _ready():
	connect_btn_level_to_signal()
	

func connect_btn_level_to_signal():
	for btn in $CenterContainer/NinePatchRect/VBoxContainer/LevelContainer/BtnLevelContainer.get_children():
		if btn.text != "Back":
			btn.connect("pressed", self, "Button_pressed", [btn.text])
		else:
			btn.connect("pressed", self, "Button_back")

func Button_pressed(btn_text):
	var level = int(btn_text)
	get_tree().change_scene("res://Levels/Level_permainan/Level"+ str(level) +".tscn")


func Button_back():
	get_tree().change_scene("res://Levels/Menu.tscn")
