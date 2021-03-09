extends TextureProgress


func _ready():
	add_to_group("GUI")

func player_get_hit():
	value -= step
	get_tree().call_group("Player", "player_get_shoot", value)
