extends CanvasLayer

var star = 0
var box_speed = 3

signal show_pause_menu

func update_star():
	star += 1
	if star % 10 == 0:
		update_speed()
	$NinePatchRect/VBoxContainer/Label.text = str(star)
	PlayerStar.score = star
	if not PlayerStar.stop:
		PlayerStar.high_score = star
	elif star > PlayerStar.high_score:
		PlayerStar.high_score = star

func update_speed():
	box_speed += 1
	return box_speed


func hide_ninepatch():
	$NinePatchRect.hide()


func _on_Pause_pressed():
	get_tree().paused = !get_tree().paused
	emit_signal("show_pause_menu")
