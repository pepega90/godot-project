extends Area2D



func _on_Flag_body_entered(body):
	if body.has_node("Key"):
		body.player_can_attack = false
		get_tree().call_group("Win", "show")
