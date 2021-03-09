extends Area2D


func _on_Briefcase_body_entered(body):
	body.collect_koper()
	queue_free()

