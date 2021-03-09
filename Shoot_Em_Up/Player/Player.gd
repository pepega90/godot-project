extends KinematicBody2D

var motion = Vector2()
var lose_condition = false
var disguise = false
var can_shoot = true
var multiplier = 1
var player_bullet = 10

onready var musuh = get_tree().root.find_node("Musuh", true, false)

export (PackedScene) var bullet
export var number_of_diguise = 3
export var box_walk_speed = 0.25

const SPEED = 20
const MAX_SPEED = 200
const FRICTION = 0.1

# Player dan Box
const PLAYER_SPRITE = "res://assets/Character/Player.png"
const PLAYER_OCCLUDER = "res://Player/Player_Occluder.tres"
const BOX_SPRITE = "res://assets/Box Disguise/box.png"
const BOX_OCCLUDER = "res://Player/Box_Occluder.tres"

func _ready():
	add_to_group("Player")
	reveal()
	get_tree().call_group("DisguiseBox", "update_box_disguise", number_of_diguise)
	get_tree().call_group("BulletInfo", "update_bullet", player_bullet)
	

func _physics_process(delta):
	player_move()
	move_and_slide(motion * multiplier)
	$DisguiseTimer.text = str($Timer.time_left).pad_decimals(2)
	$DisguiseTimer.rect_rotation = -rotation_degrees
	get_tree().call_group("NextLevel", "update_shoot_point", musuh.get_children().size())
	
	
func player_move():
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("up") and not Input.is_action_pressed("down"):
		motion.y = clamp(motion.y - SPEED, -MAX_SPEED, 0)
	elif Input.is_action_pressed("down") and not Input.is_action_pressed("up"):
		motion.y = clamp(motion.y + SPEED, 0, MAX_SPEED)
	else:
#		lerp di singkat linear interpolate
		motion.y = lerp(motion.y, 0, FRICTION)
	
	if Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = clamp(motion.x + SPEED, 0, MAX_SPEED)
	elif Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = clamp(motion.x - SPEED, -MAX_SPEED, 0)
	else:
		motion.x = lerp(motion.x, 0, FRICTION)
	
	if not lose_condition and player_bullet > 0:
		if Input.is_action_just_pressed("shoot") and can_shoot:
			shoot()
			$Shoot.stream = load("res://SFX/gun_effect.ogg")
			$Shoot.play()
			player_bullet -= 1
			get_tree().call_group("BulletInfo", "update_bullet", player_bullet)
		
func shoot():
	var bullet_instance = bullet.instance()
#	owner adalah node pemilik, dimana saat ini kita merefrensikan root sebagai owner dari node
#	dan player berada di dalammnya
	owner.add_child(bullet_instance)
#	tranform adalah posisi yang inherit dari parent node
#	global_transform adalah posisi absolute dari node tersebut dan bukan posisi inherit dari parent node
#	ini berlaku untuk semua global properti 
	bullet_instance.transform = $Position2D.global_transform

func _input(event):
	if Input.is_action_just_pressed("nightvision"):
		get_tree().call_group("Interface", "nightvision_mode")
	if Input.is_action_just_pressed("disguise"):
		toggle_disguise()
		


func toggle_disguise():
	if disguise:
		reveal()
	elif number_of_diguise > 0:
		disguise()


func reveal():
	$Sprite.texture = load(PLAYER_SPRITE)
	$Light2D.texture = load(PLAYER_SPRITE)
	$LightOccluder2D.occluder = load(PLAYER_OCCLUDER)
	$DisguiseTimer.hide()
	disguise = false
	can_shoot = true
	multiplier = 1
	collision_layer = 1


func disguise():
	$Sprite.texture = load(BOX_SPRITE)
	$Light2D.texture = load(BOX_SPRITE)
	$LightOccluder2D.occluder = load(BOX_OCCLUDER)
	$Timer.start()
	$DisguiseTimer.show()
	disguise = true
	can_shoot = false
	number_of_diguise -= 1
	get_tree().call_group("DisguiseBox", "update_box_disguise", number_of_diguise)
	multiplier = box_walk_speed
	collision_layer = 16



func collect_koper():
	var koper = Node.new()
	koper.set_name("Koper")
	add_child(koper)
	get_tree().call_group("Loot", "show_player_loot")


func player_get_shoot(player_lives):
	if player_lives == 0:
		get_tree().call_group("Lose", "player_lose")
		lose_condition = true
		visible = false
