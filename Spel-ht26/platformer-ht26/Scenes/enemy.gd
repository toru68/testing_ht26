extends CharacterBody2D

class_name Enemy

const WALK_SPEED = 100
const GRAVITY =1000
#@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var leftray: RayCast2D = $Leftray
@onready var rightray: RayCast2D = $Rightray
@onready var turn_cooldown: Timer = $TurnCooldown
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var dir: int = 1
var can_turn: bool = true

func _is_on_edge() -> bool:
	leftray.force_raycast_update()
	rightray.force_raycast_update()
	return not (leftray.is_colliding() and rightray.is_colliding())
	
	
func _physics_process(delta: float) -> void:
	
	velocity.x = dir * WALK_SPEED
	velocity.y = GRAVITY * delta
	move_and_slide()
	
	if  _is_on_edge() and can_turn:
		dir *= -1
		can_turn = false
		turn_cooldown.start()
		animated_sprite_2d.flip_h = not(animated_sprite_2d.flip_h)
		
func _on_turn_cooldown_timeout() -> void:
	can_turn = true		
	


"func _ready():
	pass
	
func _process(delta: float) -> void:
	var direction_x = 1
	position += Vector2(direction_x, 0) * 100 * delta
	
	"


"
	
func _on_player_detect_area_body_entered(body: Node2D) -> void:
	if body is Player:
	#Skapar en riktningsvektor som pekar från Enemy till spelare
		var direction_to_player = global_position.direction_to(body.global_position)
		body.enter_dead_state(direction_to_player)
	"
	


func _on_player_detect_area_body_entered(body: Node2D) -> void:
	print("enter player detect area")
	if body is Player:
	#Skapar en riktningsvektor som pekar från Enemy till spelare
		var direction_to_player = global_position.direction_to(body.global_position)
		body.enter_dead_state(direction_to_player)
