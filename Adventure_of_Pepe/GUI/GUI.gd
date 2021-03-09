extends Control

func _ready():
	$VBoxContainer/HBoxContainer/Label2.text = "3"

func update_GUI(darah, coin):
	$VBoxContainer/HBoxContainer/Label2.text = str(darah)
	$VBoxContainer/HBoxContainer2/CoinCount.text = str(coin)
