extends Control

@export var level_scene: PackedScene

func _ready() -> void:
	$CenterContainer/VBoxContainer/Label2.text = $CenterContainer/VBoxContainer/Label2.text + str(Global.score)
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("restart_game"):
		get_tree().change_scene_to_file("res://Scenes/level.tscn")
