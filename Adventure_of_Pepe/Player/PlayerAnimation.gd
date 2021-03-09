extends AnimatedSprite

func _on_Player_animation(motion):
	player_motion(motion)
	


	
func player_motion(motion):
	if motion.y < 0:
		play("jump")
	elif motion.x > 0:
		if Input.is_action_pressed("run"):
			play("run")
		else:
			play("walk")
		flip_h = false
	elif motion.x < 0:
		if Input.is_action_pressed("run"):
			play("run")
		else:
			play("walk")
		flip_h = true
	elif Input.is_action_just_pressed("attack"):
		play("fight")
	else:
		motion.x = 0
		play("idle")

