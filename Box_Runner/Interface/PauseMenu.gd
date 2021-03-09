extends CanvasLayer

func toogle_pause():
	if get_tree().paused:
		$Popup.show()
	else:
		$Popup.hide()


func _on_Button_pressed():
	get_tree().paused = false
	$Popup.hide()


func _on_ExitButton_pressed():
	get_tree().quit()


func _on_GUI_show_pause_menu():
	toogle_pause()


func _on_RestartButton_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
