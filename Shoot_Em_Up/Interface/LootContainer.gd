extends NinePatchRect


func _ready():
	hide()
	
	
func show_player_loot():
	show()
	$VBoxContainer/Loot.add_icon_item(load("res://assets/Loot/suitcase.png"), false)
	
