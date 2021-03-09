extends CanvasModulate

const DARK = Color("111111")
const NIGHTVISION = Color("33ce5a")

var cooldown = false

func _ready():
	visible = true
	color = DARK
	
func nightvision_mode():
	if not cooldown:
		if color == NIGHTVISION:
			DARK_mode()
		else:
			NIGHTVISION_mode()
		$Timer.start()
		cooldown = true


func DARK_mode():
	color = DARK
	$AudioStreamPlayer2D.stream = load("res://SFX/nightvision_off.wav")
	$AudioStreamPlayer2D.play()
	get_tree().call_group("lights", "show")
	
	
func NIGHTVISION_mode():
	color = NIGHTVISION
	$AudioStreamPlayer2D.stream = load("res://SFX/nightvision.wav")
	$AudioStreamPlayer2D.play()
	get_tree().call_group("lights", "hide")


func _on_Timer_timeout():
	cooldown = false
