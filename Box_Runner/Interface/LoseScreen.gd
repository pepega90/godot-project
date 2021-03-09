extends CanvasLayer



func show_popup():
	get_tree().call_group("GUI", "hide_ninepatch")
	$Popup/CenterContainer/NinePatchRect/VBoxContainer/HighScore.text += str(PlayerStar.high_score)
	$Popup/CenterContainer/NinePatchRect/VBoxContainer/Score.text += str(PlayerStar.score)
	$Popup.popup_centered()


func _on_Button_pressed():
	get_tree().reload_current_scene()
	PlayerStar.stop = true


