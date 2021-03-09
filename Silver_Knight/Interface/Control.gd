extends Control

export var life = 3
var coin = 0
var multiple_of_coin = 10

func _ready():
	$HBoxContainer/Label.text = str(life) + "x"
	$CoinContainer/Coin.text = str(coin) + "x"
	$KeyContainer/ItemList.hide()
	$KeyContainer/ItemList.clear()
	
func update_life():
	life -= 1
	if life <= 0:
		get_tree().call_group("DieScreen", "show_die_screen")
		life = 0
	$HBoxContainer/Label.text = str(life) + "x"


func update_coin():
	coin += 1
	var player_get_multiple_coin = (coin % multiple_of_coin) == 0
	if player_get_multiple_coin:
		life_up()
	$CoinContainer/Coin.text = str(coin) + "x"
	

func life_up():
	life += 1
	$HBoxContainer/LiveUps.play("LifeUp")
	$HBoxContainer/Label.text = str(life) + "x"
	
func player_get_key():
	$KeyContainer/ItemList.show()
	$KeyContainer/ItemList.add_icon_item(load("res://assets/UI Component/keyBlue.png"), false)
