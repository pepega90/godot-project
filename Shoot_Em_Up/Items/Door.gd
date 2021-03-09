extends Area2D

var can_open_door = false


func _on_Door_body_entered(body):
	if body.collision_layer == 1:
		can_open_door = true
		body.can_shoot = false
	else:
		open_door()


func _on_Door_body_exited(body):
	if body.collision_layer == 1:
		can_open_door = false
		body.can_shoot = true



func _on_Door_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_RIGHT) and can_open_door:
		open_door()



func open_door():
	$AnimationPlayer.play("Open")
