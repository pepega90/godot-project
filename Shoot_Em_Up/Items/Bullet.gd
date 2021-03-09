extends Area2D

const SPEED = 750

func _physics_process(delta):
	position += transform.x * SPEED * delta


func _on_Bullet_body_entered(body):
	if body.is_in_group("enemy"):
		if body.is_die():
			body.queue_free()
	elif body.is_in_group("Player"):
		get_tree().call_group("GUI", "player_get_hit")
	queue_free()
