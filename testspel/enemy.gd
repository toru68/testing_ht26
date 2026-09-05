extends CharacterBody2D


const SPEED = 300

#En referens till spelarscenen, sätts av föräldrern
var player: Player

func _ready() -> void:
	show()

func _physics_process(delta: float) -> void:
	if player:
		var dir: Vector2 = global_position.direction_to(player.global_position)
		velocity = dir * SPEED
		move_and_slide()


func _on_player_detect_area_body_entered(body: Node2D) -> void:
	if body is Player:
		body.die()
