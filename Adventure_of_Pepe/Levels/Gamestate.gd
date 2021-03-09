extends Node2D

var lives = 3
var coin = 0
var target_coin = 10

func _ready():
	add_to_group("Gamestate")

func update_GUI():
	get_tree().call_group("GUI", "update_GUI", lives, coin)

func end_game():
	get_tree().change_scene("res://Levels/Gameover.tscn")

func coin_taken():
	coin += 1
	var multiple_coin = (coin % target_coin) == 0
	if multiple_coin:
		plus_lives()
	update_GUI()

func plus_lives():
	lives += 1
	update_GUI()

func hurt():
	lives -= 1
	update_GUI()
	if lives < 0:
		end_game()

func next_level(level):
	get_tree().change_scene("res://Levels/Level" + str(level) + ".tscn")
	if level > 3:
		get_tree().change_scene("res://GUI/Game_End.tscn")
