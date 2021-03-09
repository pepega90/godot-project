extends KinematicBody2D

const FOV_TOLERANCE = 20
const RED = Color(1,0.25,0.25)
const WHITE = Color(1,1,1)
const MAX_DETECTION_RANGE = 640

var Player

func _ready():
	Player = get_node("/root").find_node("Player", true, false)


func _process(delta):
	if Player_in_FOV() and Player_in_LOS():
		$Flashlight.color = RED
		get_tree().call_group("enemy", "_on_Enemy_body_entered", Player)
	else:
		$Flashlight.color = WHITE

#todo
#malem bikni level 9-10
# sama tombol select level dan pilihan levelnya

func Player_in_FOV():
#	bikin arah camera menghadap
	var camera_facing = Vector2(1, 0).rotated(global_rotation)
#	dapatkan jarak antara posisi camera dengan player
	var direction_to_player = (Player.position - global_position).normalized()
#	cek apakah angel arah hadap camera dari posisi camera ke player apakah lebih kecil dari FOV_TOLERANCE
	if abs(direction_to_player.angle_to(camera_facing)) < deg2rad(FOV_TOLERANCE):
		return true
	else:
		return false


func Player_in_LOS():
#	dapatkan world2d, properti direct_space_state untuk mendapatkan physic engine collison
	var world2d = get_world_2d().direct_space_state
#	bikin garis dari posisi camera, ke player, exclude sef menggunakan collison mask
	var LOS_obstacle = world2d.intersect_ray(global_position, Player.position,[self],collision_mask)
#	cek apakah line of sight nya sudah dibuat
	if not LOS_obstacle:
		return false
#	dapatkan jarak camera ke player
	var distance_to_player = Player.global_position.distance_to(global_position)
#	cek apakah garis line of sight collide dengan player dan jarak camera ke player kurang dari max detection range camera
	if LOS_obstacle.collider == Player and distance_to_player < MAX_DETECTION_RANGE:
		return true
	else:
		return false
