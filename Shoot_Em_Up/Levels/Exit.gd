extends ColorRect


func _on_Area2D_body_entered(body):
	if body.has_node("Koper"):
		get_tree().call_group("NextLevel", "show")
#		get_tree().change_scene("res://Levels/Victory.tscn")
