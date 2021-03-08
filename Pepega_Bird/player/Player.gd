extends KinematicBody2D

var motion = Vector2(0, 0)

onready var gamestate = get_tree().root.find_node("World", true, false)

const GRAVITY = 10
const UP = Vector2(0, -1)
const MAX_FALL = 750
const JUMP = 200

func _physics_process(delta):
	player()
	
func player():
	motion.y += GRAVITY
	
	if motion.y > MAX_FALL:
		motion.y = -MAX_FALL
	
	if Input.is_action_pressed("flap") or Input.is_mouse_button_pressed(BUTTON_LEFT):
		motion.y = -JUMP
	
	move_and_slide(motion, UP)

func die():
	get_tree().change_scene("res://Gameover.tscn")

