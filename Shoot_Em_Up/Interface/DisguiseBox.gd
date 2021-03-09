extends ItemList

func update_box_disguise(number_of_disguise):
	clear()
	for box in range(number_of_disguise):
		add_icon_item(load("res://assets/Box Disguise/box.png"), false)
