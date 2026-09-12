extends Node2D

const ENEMY_SCENE = preload("res://enemy.tscn")

var waiting_for_reload = false
var waiting_timer = 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_spawn_enemy()
	
	$Player.connect("dead", _on_player_dead)
	
	$ReloadTimer.wait_time = 0.5
	$ReloadTimer.one_shot = true
	$EnemySpawnTimer.wait_time = randf_range(4.0, 6.0)
	
func _process(delta: float) -> void:
	pass
	"""
	if waiting_for_reload:
		waiting_timer += delta
		
		if waiting_timer >= 1.0:
			get_tree().call_deferred("reload_current_scene")
			
	"""
func _on_player_dead() -> void:
	#print("SPELAREN DÖÖÖD")
	#get_tree().reload_current_scene()
	#waiting_for_reload = true
	$ReloadTimer.start()
	

func _on_reload_timer_timeout() -> void:
	#print("Reload timer")
	get_tree().call_deferred("reload_current_scene")


func _spawn_enemy() -> void:
	var enemy = ENEMY_SCENE.instantiate()
	var spawn_randomizer = randi_range(1, 4)
	var spawn_node_name = "EnemySpawnPos" + str(spawn_randomizer)
	
	enemy.global_position = get_node(spawn_node_name).global_position
	add_child(enemy)
	
	enemy.player = get_node("Player")  #Enemys referens till spelaren sätts


func _on_enemy_spawn_timer_timeout() -> void:
	$EnemySpawnTimer.wait_time = randf_range(4.0, 6.0)
	_spawn_enemy()
