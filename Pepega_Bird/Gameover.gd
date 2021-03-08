extends Control

func _ready():
	$VBox/Label2.text += str(PlayerScore.get_player_score())
	$VBox/Label3.text += str(PlayerScore.top_score)

func _input(event):
#	if Input.is_action_just_pressed("restart") or Input.is_action_just_pressed("start_game"):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		PlayerScore.stop_inc = true
		PlayerScore.player_score = 0
		get_tree().change_scene("res://World.tscn")
