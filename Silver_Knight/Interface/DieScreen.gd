extends Control

onready var player = get_node("/root").find_node("Player", true, false)

var player_die = false

func _ready():
	$CenterContainer/Label.hide()


func _input(event):
	if player_die and Input.is_mouse_button_pressed(BUTTON_LEFT):
		get_tree().reload_current_scene()


func show_die_screen():
	player.hide()
	$CenterContainer/Label.show()
	player_die = true
	
	
func show_label():
	$CenterContainer/Label.show()
	
