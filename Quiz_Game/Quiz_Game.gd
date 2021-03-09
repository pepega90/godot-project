extends Control

onready var pertanyaan_label = $PertanyaanContainer/PertanyaanPlaceholder
onready var btn_list = $BtnContainer
var current_pertanyaan
var score = 0
var correct = 0
var player_answer = []

var template_pertanyaan = [
	{
		"tanya": "Berapa Hasil dari 5 + 3?",
		"jawab": ["2", "8", "10", "7"],
		"jawabanBenar": "8"
	},
	{
		"tanya": "Berapa Hasil dari 10 * 5?",
		"jawab": ["25", "55", "50", "15"],
		"jawabanBenar": "50"
	},
	{
		"tanya": "Siapakah penemu odading?",
		"jawab": ["Mang oleh", "ade londok", "ade ray", "uzumaki bayu"],
		"jawabanBenar": "Mang oleh"
	},
	{
		"tanya": "Apa singkatan HTML?",
		"jawab": ["Hyper text markup language", "Hyper text machine learning", "Hyper text mama cleaning", "Hyper sex milf learn"],
		"jawabanBenar": "Hyper text markup language"
	}
]

func _ready():
	randomize()
	random_pertanyaan()
	show_pertanyaan()
	connect_btn_to_signal()
	check_score()
	$Retry.hide()

func random_pertanyaan():
	randomize()
	current_pertanyaan = template_pertanyaan[player_answer.size()]
	
func btn_jawaban():
	for i in btn_list.get_child_count():
		var button = btn_list.get_child(i)
		button.text = current_pertanyaan.jawab[i]

func show_pertanyaan():
	random_pertanyaan()
	pertanyaan_label.text = current_pertanyaan.tanya
	btn_jawaban()

func check_jawaban(button):
	if button.text == current_pertanyaan.jawabanBenar:
		score += 1
		correct += 1

func add_player_jawaban(jwb):
	player_answer.append(jwb.text)
	check_jawaban(jwb)
	check_score()
	
	
func check_score():
	if game_done():	
		end_game()
	else:
		show_pertanyaan()
	
func game_done() -> bool:
	return player_answer.size() == current_pertanyaan.jawab.size()
	
func end_game():
	pertanyaan_label.text = "Anda menjawab " + str(correct) + " dari 4 pertanyaan score anda adalah = " + str(score)
	btn_list.queue_free()
	$Retry.show()

func connect_btn_to_signal():
	get_node("BtnContainer/Button").connect("pressed", self, "_on_Button_pressed1")
	get_node("BtnContainer/Button2").connect("pressed", self, "_on_Button2_pressed")
	get_node("BtnContainer/Button3").connect("pressed", self, "_on_Button3_pressed")
	get_node("BtnContainer/Button4").connect("pressed", self, "_on_Button4_pressed")

func _on_Button_pressed1():
	if game_done():
		get_tree().reload_current_scene()
	else:
		add_player_jawaban(btn_list.get_node("Button"))


func _on_Button2_pressed():
	if game_done():
		get_tree().reload_current_scene()
	else:
		add_player_jawaban(btn_list.get_node("Button2"))


func _on_Button3_pressed():
	if game_done():
		get_tree().reload_current_scene()
	else:
		add_player_jawaban(btn_list.get_node("Button3"))


func _on_Button4_pressed():
	if game_done():
		get_tree().reload_current_scene()
	else:
		add_player_jawaban(btn_list.get_node("Button4"))


func _on_Retry_pressed():
	get_tree().reload_current_scene()
