extends Spatial

var skin_list = {}
var current_skin : int
var selected_skin

func _ready():
	skin_list = FileGrabber.get_files("res://Player/PlayerMaterials/")

	
func change_skin(direction):
	var skin_list_count = skin_list.size() - 1
	
	select_material(direction, skin_list_count)
	
	var player = $Player/Armature/Skeleton/CubeDube
	
	selected_skin = load(skin_list[current_skin])
	
	player.get_surface_material(0).albedo_texture = selected_skin


func select_material(direction, skin_list_count):
	if direction == "Right":
		if current_skin == skin_list_count:
			current_skin = 0
		else:
			current_skin += 1
	else:
		if current_skin == 0:
			current_skin = skin_list_count
		else:	
			current_skin -= 1



func on_begin_game():
	get_tree().change_scene("res://Level/Game.tscn")
