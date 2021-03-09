extends Node2D



func _on_Area2D_body_entered(body):
	body.player_get_key()
	queue_free()
