extends Area2D

var akses_komputer = false
var generate_kombinasi

export var kombinasi_length = 4


signal computer_kombinasi


func _ready():
	generate_random_kombinasi()
	emit_signal("computer_kombinasi", generate_kombinasi)


func generate_random_kombinasi():
	generate_kombinasi = CombinationGenerator.generate_random_kombinasi(kombinasi_length)
	set_text_popup()


func set_text_popup():
	$CanvasLayer/ComputerPopup.set_text(generate_kombinasi)


func _on_Computer_body_entered(body):
	akses_komputer = true
	$Light2D.enabled = true


func _on_Computer_body_exited(body):
	akses_komputer = false
	$Light2D.enabled = false
	$CanvasLayer/ComputerPopup.hide()


func _on_Computer_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_RIGHT) and akses_komputer:
		$CanvasLayer/ComputerPopup.popup_centered()
