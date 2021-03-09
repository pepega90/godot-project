extends KinematicBody

var motion = Vector3()
var gravity = Vector3.DOWN * 12
var can_move = true
var facing = 50

const SPEED = 3
const JUMP_SPEED = 6

func _physics_process(delta):
	if can_move:
		move()
		jump()
	motion += gravity * delta
	motion = move_and_slide(motion, Vector3.UP)
	

func move():
	$AnimationPlayer.play("Arms Cross Walk")
	motion.x = 0
	rotation_degrees.y = 0
	if Input.is_action_pressed("left"):
		motion.x += SPEED
		rotation_degrees.y = facing
	if Input.is_action_pressed("right"):
		motion.x -= SPEED
		rotation_degrees.y = -facing

	


func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y = JUMP_SPEED
	
	if not is_on_floor():
		$AnimationPlayer.stop()
