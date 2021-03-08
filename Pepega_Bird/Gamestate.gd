extends Node2D

var score = 0

func _ready():
	add_to_group("Gamestate")
	

func update_score():
	score += 1
	PlayerScore.set_player_score(score)
	if not PlayerScore.stop_inc:
		PlayerScore.top_score = score
	elif score > PlayerScore.top_score:
		PlayerScore.top_score = score
	get_tree().call_group("GUI", "update_score", score)
