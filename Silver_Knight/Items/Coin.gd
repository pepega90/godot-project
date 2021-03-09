extends Node2D

var get_coin = false

func _ready():
	$AnimatedSprite.playing = true

func _on_Area2D_body_entered(body):
	if not get_coin:
		get_coin = true
		$AnimationPlayer.play("GetCoin")
		$CoinAudio.play()
		get_tree().call_group("GUI", "update_coin")
	
func player_get_coin():
	queue_free()
