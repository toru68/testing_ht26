extends CharacterBody2D

class_name Player

const  MAX_SPEED: int = 400
const ACC: int = 1500

#Godots spelloop: anropas automatiskt av spelmptorn 60 ggr/sek.
func _physics_process(delta: float) -> void:
	
	
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = velocity.move_toward(direction*MAX_SPEED, ACC*delta)
	
	move_and_slide()
	
	#print(get_slide_collision_count())
	#if(Input.is_action_pressed("down")):
	#	$PlayerShape.rotation += 0.1*delta



	
