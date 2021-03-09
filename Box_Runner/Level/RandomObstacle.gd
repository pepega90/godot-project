extends Spatial

func _physics_process(delta):
	translation.z += -2 * delta
	if translation.z <= -11:
		queue_free()
