extends Area2D

func _on_Ground_body_entered(body):
	if body.has_method("die"):
		body.die()
