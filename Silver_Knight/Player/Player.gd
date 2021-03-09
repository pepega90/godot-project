extends KinematicBody2D

var motion = Vector2()
var isAttack = false
var life = 50
var get_hurt = false
var player_can_attack = true

const SPEED = 500
const UP = Vector2(0, -1)
const WORD = 2000

func _physics_process(delta):
	apply_gravity()
	player_move()
	player_attack()
	player_jump()
	player_get_hurt()
	end_game()
	move_and_slide(motion, UP)
	

func player_move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right") and isAttack == false:
		motion.x = -SPEED
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = true
		get_node("AttackArea").set_scale(Vector2(-1,1))
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left") and isAttack == false:
		motion.x = SPEED
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = false
		get_node("AttackArea").set_scale(Vector2(1,1))
	else:
		motion.x = lerp(motion.x, 0, 0.1)
		if isAttack == false:
			$AnimatedSprite.play("idle")
			
#	if Input.is_action_just_pressed("restart"):
#		get_tree().reload_current_scene()

func player_attack():
	if Input.is_action_just_pressed("attack") and player_can_attack:
		$AnimatedSprite.play("attack")
		$AttackArea/CollisionShape2D.disabled = false
		isAttack = true

func player_jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y = -3000
	if motion.y < 0 and !isAttack:	
		$AnimatedSprite.play("jump")


func apply_gravity():
	if is_on_floor() and motion.y > 0:
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += 150

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "attack":
		$AttackArea/CollisionShape2D.disabled = true
		isAttack = false


func hurt():
	position.y += 1
	yield(get_tree(),"idle_frame")
	get_hurt = true
	motion.y = -2000
	$PlayerGetHurt.play()
	get_tree().call_group("GUI", "update_life")
	
		
func player_get_hurt():
	if get_hurt:
		$Timer.start()
		$AnimatedSprite.self_modulate = "ff8484"

func player_get_key():
	var key = Node.new()
	key.set_name("Key")
	add_child(key)
	get_tree().call_group("GUI", "player_get_key")


func end_game():
	if position.y > WORD:
		$Camera2D.current = false
		get_tree().call_group("DieScreen", "show_label")
		if Input.is_mouse_button_pressed(BUTTON_LEFT):
			get_tree().reload_current_scene()


func _on_Timer_timeout():
	yield(get_tree(),"idle_frame")
	$AnimatedSprite.self_modulate = "ffffff"
