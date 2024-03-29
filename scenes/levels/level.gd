extends Node2D
class_name LevelParent 

var player_projectile_scene: PackedScene = preload("res://scenes/projectiles/playerProjectile.tscn")

var maxAmountOfEnemies = 3
var is_finished: bool = false

func _on_player_player_shoot(positions: PackedVector2Array) -> void:
	for pos in positions:
		var player_projectile = player_projectile_scene.instantiate()
		player_projectile.position = pos
		$Projectiles.add_child(player_projectile, true)

func _on_increase_score_timeout():
	Globals.score += 10

func _on_player_player_death():
	is_finished = true
	$"IncreaseScore".stop()
	$"EnemySpawn".stop()
	$"ItemSpawn".stop()
	
func handleMaxAmountOfEnemies():
	if($"Enemies".get_child_count() >= maxAmountOfEnemies and not $EnemySpawn.is_stopped()):
		$EnemySpawn.stop()
	elif($"Enemies".get_child_count() < maxAmountOfEnemies and $EnemySpawn.is_stopped()):
		$EnemySpawn.start()
	
func _process(_delta):
	if not is_finished:
		handleMaxAmountOfEnemies()
	else:
		pass
