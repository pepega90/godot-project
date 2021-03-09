extends Popup

var kombinasi = []
var player_kombinasi = []

onready var display = $VBoxContainer/DisplayContainer/Display
onready var light = $VBoxContainer/ButtonContainer/GridContainer/LightStatus


signal door_unlocked


func _ready():
	connect_buttons()
	reset_kombinasi()
	

func connect_buttons():
	for btn in $VBoxContainer/ButtonContainer/GridContainer.get_children():
		if btn is Button:
			btn.connect("pressed", self, "Buttons_pressed", [btn.text])
			
	
func Buttons_pressed(btn_value):
	if btn_value == "OK":
		check_kombinasi()
	else:
		player_enter_kombinasi( int(btn_value) )


func player_enter_kombinasi(btn):
	$AudioStreamPlayer.play()
	player_kombinasi.append(btn)
	update_display()
	

func update_display():
	display.text = PoolStringArray(player_kombinasi).join("")
	if player_kombinasi.size() == kombinasi.size():
		check_kombinasi()


func check_kombinasi():
	if player_kombinasi == kombinasi:
		light.texture = load("res://assets/UI Element/dotGreen.png")
		$Timer.start()
	else:
		reset_kombinasi()


func reset_kombinasi():
	display.text = ""
	light.texture = load("res://assets/UI Element/dotRed.png")
	player_kombinasi.clear()


func _on_Timer_timeout():
	emit_signal("door_unlocked")
	reset_kombinasi()
