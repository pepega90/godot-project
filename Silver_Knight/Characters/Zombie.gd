extends KinematicBody2D

var motion = Vector2()

# direction untuk menentukan arah dari musuh, jika -1 maka ke kiri jika 1 maka ke kanan
export var direction = -1

func _ready():
	$TextureProgress.hide()
#	awal-awala kita buat musuh ke arah kanan
	if direction == 1:
#		dan buat juga menghadap ke kanan
		$AnimatedSprite.flip_h = true
#	extends positi collision dari player untuk raycast
#	kalikan dengan direction, jika minus  maka ke kiri jika plus maka ke kanan
	$Floorcheck.position.x = $CollisionShape2D.shape.get_extents().x * direction

func _physics_process(delta):
	apply_gravity()
	patroli()
	die()
	move_and_slide(motion, Vector2.UP)
	

func apply_gravity():
	if is_on_floor():
		motion.y = 0
	else:
		motion.y = 1000

	
func patroli():
#	jika menabrak dinding atau raycast tidak collider ubah arahnya dan hadapnya
	if is_on_wall() or not $Floorcheck.is_colliding():
		direction = direction * -1
		$AnimatedSprite.flip_h = !$AnimatedSprite.flip_h
		$Floorcheck.position.x = $CollisionShape2D.shape.get_extents().x * direction
#	ini pergerakan musuh posisi x dikali direction	
	motion.x = 100 * direction
	$AnimatedSprite.play("walk")

func die():
	if $TextureProgress.value <= 0:
		queue_free()

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		body.hurt()


func _on_Area2D_body_exited(body):
	if body.name == "Player":
		body.get_hurt = false



func _on_Area2D_area_entered(area):
	if area.is_in_group("Sword"):
		$GetHitSound.play()
		$TextureProgress.value -= $TextureProgress.step
		$TextureProgress.show()


func _on_VisibilityNotifier2D_screen_exited():
	$TextureProgress.hide()


func _on_VisibilityNotifier2D_screen_entered():
	$Groan.play()
