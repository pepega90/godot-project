extends Area

var taken = false

onready var player = get_tree().root.find_node("Player", true, false)

func _physics_process(delta):
	if player.can_move == true:
		translation.z += -3 * delta
	if translation.z <= -12:
		queue_free()


func _on_Stars_body_entered(body):
	if body.name == "Player":
		if not taken:
			taken = true
			$AnimationPlayer.play("Gone")
			$AudioStreamPlayer.play()
			get_tree().call_group("GUI", "update_star")
	else:
		queue_free()
	

func player_get_star():
	queue_free()
