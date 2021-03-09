extends Node2D

onready var pointer = $Pointer

func _ready():
	update_pointer_position(0)
	$Flashlight4.enabled = false
	

func update_pointer_position(objective_position):
	var place_obj = $ObjectivePosition.get_child(objective_position)
	var message_obj = $ObjectiveMessage.get_child(objective_position)
	$Tween.interpolate_property(pointer, "position", pointer.position, place_obj.position, 0.5,Tween.TRANS_SINE,Tween.EASE_OUT_IN)
	$Tween.start()
	$PointerSound.play()
	$TutorMessage/AnimationPlayer.play("MessageChange")
	$TutorMessage/Control/NinePatchRect/Label.text = message_obj.tutorMsg
	
func _on_MoveObj_body_entered(body):
	update_pointer_position(1)


func _on_DoorObj_body_entered(body):
	update_pointer_position(2)



func _on_ShootObj_body_entered(body):
	update_pointer_position(3)
	


func _on_NightvisionObj_body_entered(body):
	update_pointer_position(4)
	


func _on_LootObj_body_entered(body):
	pointer.queue_free()
	$TutorMessage/Control/NinePatchRect/Label.text = "Luar biasa, kamu terlihat hebat sebagai agent baru, sekarang kita mulai misi yang sebernarnya"
	$Flashlight4.enabled = true


