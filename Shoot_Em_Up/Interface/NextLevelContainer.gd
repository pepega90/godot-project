extends NinePatchRect

var shoot_point

onready var size_musuh = get_node("/root").find_node("Musuh", true, false).get_children().size()

func _ready():
	hide()

func update_shoot_point(enemy_die):
	$VBoxContainer/ShootPoint/VBoxContainer/ItemList.clear()
	if enemy_die == size_musuh:
		shoot_point = 3	
	else:
		shoot_point = 2
		
	if enemy_die == 0:
		shoot_point = 1
		
	for kills in range(shoot_point):
		$VBoxContainer/ShootPoint/VBoxContainer/ItemList.add_icon_item(load("res://assets/UI Element/crossair_black.png"), false)


func _on_NextLevelButton_pressed():
	$Timer.start()


func go_next_level():
	var level = int(get_tree().current_scene.name)
	print(level)
	if level == 10 and level < 11:
		get_tree().change_scene("res://Levels/Victory.tscn")
	level += 1
	get_tree().change_scene("res://Levels/Level_permainan/Level" + str(level) + ".tscn")
	


func _on_Timer_timeout():
	go_next_level()
