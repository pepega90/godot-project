extends StaticBody

onready var Player = get_tree().root.find_node("Player", true, false)
func _physics_process(delta):
	if Player.can_move == true:
		translation.z += -3 * delta
	if translation.z <= -12:
		queue_free()


func _on_Area_body_entered(body):
	if body is KinematicBody:
		body.can_move = false
		get_tree().call_group("Lose", "show_popup")
