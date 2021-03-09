extends "res://Items/Door.gd"


func _on_Door_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_RIGHT) and can_open_door:
		$CanvasLayer/Numpad.popup_centered()

func _on_Door_body_exited(body):
	if body.collision_layer == 1:
		can_open_door = false
		body.can_shoot = true
		$CanvasLayer/Numpad.hide()

func _on_Numpad_door_unlocked():
	open_door()
	$CanvasLayer/Numpad.hide()


func _on_Computer_computer_kombinasi(combination):
	$CanvasLayer/Numpad.kombinasi = combination
