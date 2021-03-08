extends CanvasLayer


func _ready():
	$Control/HBoxContainer/Label.text = "0"

func update_score(score):
	$Control/HBoxContainer/Label.text = str(score)
