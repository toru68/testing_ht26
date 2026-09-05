extends CharacterBody2D

class_name Player

#signal för att meddela ett annat script att spelaren är död
signal dead

const  MAX_SPEED: int = 400
const ACC: int = 1500

#Godots spelloop: anropas automatiskt av spelmptorn 60 ggr/sek.
func _physics_process(delta: float) -> void:
	
	
	var direction = Input.get_vector("left", "right", "up", "down")
	
	#velocity är en egenskap som tillhör Characterbody. Representerar dess rörelsevektor.
	velocity = velocity.move_toward(direction*MAX_SPEED, ACC*delta)
	#velocity = direction * MAX_SPEED   Ingen Acceleration
	
	#Inbyggd rörelsefunktion: rörelse utförs enligt velocity-vector och hantera kollisioner automatiskt.
	move_and_slide()
	
func die()-> void:
	#Funktions som anropas av enemy då spelaren är tagen.
	hide()
	emit_signal("dead")



	
