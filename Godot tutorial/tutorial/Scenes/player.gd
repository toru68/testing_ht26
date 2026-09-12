extends Node2D

var speed := 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(100, 400)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	position += direction * speed * delta
