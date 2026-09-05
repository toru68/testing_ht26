extends Node2D

const ENEMY_SCENE = preload("res://enemy.tscn")

var waiting_for_reload = false
var waiting_timer = 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var enemy = ENEMY_SCENE.instantiate()
	enemy.global_position = $EnemySpawnPos1.global_position
	add_child(enemy)
	
	enemy.player = $Player   #Enemys referens till spelaren sätts
	$Player.connect("dead", _on_player_dead)
	
	$ReloadTimer.wait_time = 0.5
	$ReloadTimer.one_shot = true
	
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
	
	get_tree().call_deferred("reload_current_scene")
