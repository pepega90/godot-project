extends KinematicBody2D

var motion = Vector2()
var player = null
var Player
var timeout = false
var possible_destination
var path 
var enemy_lives = 10
var patroli = true

onready var navigation = get_tree().get_root().find_node('Navigation2D', true, false)
onready var destination = navigation.get_node("Destination")
onready var timer = $ShootTime
onready var patroli_timer = $PatroliTime
export var minimum_arrival_distance = 5
export var walk_speed = 0.5

const MAX_SPEED = 300
const FOV_TOLERANCE = 20
const RED = Color(1,0.25,0.25)
const WHITE = Color(1,1,1)
const MAX_RANGE_DETECTION = 540
const MAX_RANGE_ENEMY_SHOOT = 320

export (PackedScene) var bullet

func _ready():
	Player = get_node("/root").find_node("Player", true, false)
	randomize()
	possible_destination = destination.get_children()
	make_path()


func _physics_process(delta):
	#	patroli
	if patroli:
		navigate()
##	jika player masuk ke area2d-nya musuh arahkan ke player dan tembak player
#	if player:
#		look_at(player.position)
#		motion = (player.position - position).normalized() * (MAX_SPEED * walk_speed)
##		patroli kita buat false karena musuh sendang menyerang player
#		patroli = false
#		move_and_slide(motion)
#		if player.lose_condition:
#			player = null
#			patroli = true
#			stop()
	if Player_in_FOV() and Player_in_LOS():
		$Flashlight.color = RED
		look_at(Player.position)
		patroli = false
		motion = (Player.position - position).normalized() * (MAX_SPEED * walk_speed)
		var minimum_distance_enemy_shoot = Player.position.distance_to(position) > MAX_RANGE_ENEMY_SHOOT
		if minimum_distance_enemy_shoot:
			move_and_slide(motion)
		shoot_player()
	else:
		$Flashlight.color = WHITE
		patroli = true
	
	if Player.lose_condition:
		patroli = true
		stop()
	
	
func make_path():
	$PatroliTime.start()
	var new_destination = possible_destination[randi() % possible_destination.size() - 1]
	path = navigation.get_simple_path(position, new_destination.position, false)



func Player_in_FOV():
	var npc_facing_direction = Vector2(1, 0).rotated(global_rotation)
#	if player:
	var direction_to_player = (Player.position - global_position).normalized()
	if abs(direction_to_player.angle_to(npc_facing_direction)) < deg2rad(FOV_TOLERANCE):
		return true
	else:
		return false


func Player_in_LOS():
	var world2d = get_world_2d().direct_space_state
	var raycast_line = world2d.intersect_ray(global_position,Player.position,[self],collision_mask)
	if not raycast_line:
		return false
	var jarak_raycast_ke_player = Player.global_position.distance_to(global_position)
	
	if raycast_line.collider == Player and jarak_raycast_ke_player < MAX_RANGE_DETECTION:
		return true
	else:
		return false

func navigate():
	var distance_to_destination = position.distance_to(path[0])
	if distance_to_destination > minimum_arrival_distance:
		patroli()
	else:
		update_patroli()


func patroli():
	look_at(path[0])
	motion = (path[0] - position).normalized() * (MAX_SPEED * walk_speed)
	if is_on_wall():
		make_path()
	move_and_slide(motion)


func update_patroli():
	if path.size() == 1:
		if $PatroliTime.is_stopped():
			$PatroliTime.stop()
	else:
		path.remove(0)
	

func shoot_player():
	if not timeout:
		var bullet_instance = bullet.instance()
		owner.add_child(bullet_instance)
		bullet_instance.transform = $Position2D.global_transform
		$Shoot.play()
		start()
		timeout = true


func is_die():
	enemy_lives -= 10
	if enemy_lives < 0:
		return true


func _on_Timer_timeout():
	timeout = false


func start():
	timer.start()

func stop():
	timer.stop()


func _on_PatroliTime_timeout():
	make_path()

