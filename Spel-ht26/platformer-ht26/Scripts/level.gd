extends Node2D

const PLAYER_SCENE = preload("res://Scenes/player.tscn")
@onready var player: Player = $Player
@onready var player_spawn_pos: Marker2D = $PlayerSpawnPos
@onready var camera_2d: Camera2D = $Camera2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.get_node("RemoteTransform2D").remote_path = camera_2d.get_path()
	player.connect("dead", _on_player_dead)
	for checkpoint in get_tree().get_nodes_in_group("Checkpoint"):
		checkpoint.connect("activated", _on_checkpoint_activated)
		
func _on_checkpoint_activated(pos: Vector2, node_name: String) -> void:
	for checkpoint in get_tree().get_nodes_in_group("Checkpoint"):
		if checkpoint.name != node_name:
			checkpoint.deactivate()
			
	player_spawn_pos.global_position = pos
	print(pos)

func _on_player_dead() -> void:
	#print("hejj")
	player = PLAYER_SCENE.instantiate()
	player.connect("dead", _on_player_dead)
	player.global_position = $PlayerSpawnPos.global_position
	print(player.global_position)
	player.get_node("RemoteTransform2D").remote_path = camera_2d.get_path()
	add_child(player)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
