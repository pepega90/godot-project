extends Area2D

func _on_Spikeman_body_entered(body):
	body.hurt()
