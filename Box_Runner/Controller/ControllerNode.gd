extends Node2D



func _on_Left_pressed():
	 Input.is_action_pressed("ui_left")


func _on_Left_released():
	 Input.is_action_pressed("ui_left")


func _on_Right_pressed():
	 Input.is_action_pressed("ui_right")


func _on_Right_released():
	 Input.is_action_pressed("ui_right")


func _on_Jump_pressed():
	 Input.is_action_pressed("jump")
	


func _on_Jump_released():
	 Input.is_action_pressed("jump")
	
