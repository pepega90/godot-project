extends KinematicBody2D

var motion = Vector2(0, 0)
var isAttacking = false

const GRAVITY = 100
const UP = Vector2(0, -1)
const JUMP_FORCE = -2000
const SPEED = 500
const WORLD_LIMIT = 3000


# TODO
# buat level

signal animation

func _physics_process(delta):
	apply_gravity()
	player()
	animate()
	player_jump()
	player_run()
	move_and_slide(motion, UP)

func player():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED
	else:
		motion.x = 0
	
func player_jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y = JUMP_FORCE

func player_run():
	if Input.is_action_pressed("run"):
		if Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
			motion.x = SPEED + 500
		elif Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
			motion.x = -SPEED + -500
		else:
			motion.x = 0



func apply_gravity():
	if position.y > WORLD_LIMIT:
		get_tree().call_group("Gamestate", "end_game")
	elif is_on_floor() and motion.y > 0:
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY

func animate():
	emit_signal("animation", motion)
	
	
func hurt():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	motion.y = JUMP_FORCE
	$Hurt.play()
	get_tree().call_group("Gamestate", "hurt")

