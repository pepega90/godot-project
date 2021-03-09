extends Control

func update_point(number_point):
	for i in range(number_point):
		$CenterContainer/NinePatchRect/VBoxContainer/CenterContainer2/VBoxContainer/ItemList.add_icon_item(load("res://assets/UI Element/crossair_black.png"), false)
