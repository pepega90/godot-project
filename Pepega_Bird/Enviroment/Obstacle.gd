extends Node2D

func _physics_process(delta):
	position.x += -215 * delta
	if global_position.x <= -200:
		queue_free()


func _on_Wall_body_entered(body):
	if body.has_method("die"):
		body.die()

func _on_DetectScore_body_exited(body):
	get_tree().call_group("Gamestate", "update_score")
	
