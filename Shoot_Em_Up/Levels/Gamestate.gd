extends Node2D

func _ready():
	add_to_group("Gamestate")
	$CanvasLayer/VBoxContainer/Label.visible = false
	$CanvasLayer/VBoxContainer.visible = false
	
func show_message_game(text):
	$CanvasLayer/VBoxContainer.visible = true
	$CanvasLayer/VBoxContainer/Label.visible = true
	$CanvasLayer/VBoxContainer/Label.text = text
