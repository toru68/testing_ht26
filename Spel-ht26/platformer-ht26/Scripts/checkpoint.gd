extends Area2D

signal activated(pos, name)

var is_activated: bool = false


func deactivate() -> void:
	# Anropas av Level
	is_activated = false
	$AnimatedSprite2D.play("not active")
	#emit_signal("not active", global_position, name)
	

func _on_body_entered(body: Node2D) -> void:
	if body is Player and not is_activated:
		is_activated = true
		$AnimatedSprite2D.play("active")
		emit_signal("activated", global_position, name)
		
