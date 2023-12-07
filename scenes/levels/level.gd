extends Node2D
class_name LevelParent 

var player_projectile_scene: PackedScene = preload("res://scenes/projectiles/playerProjectile.tscn")

func _on_player_player_shoot(pos: Vector2) -> void:
	var player_projectile = player_projectile_scene.instantiate()
	player_projectile.position = pos
	$Projectiles.add_child(player_projectile, true)

func _on_increase_score_timeout():
	Globals.score += 10

func _on_player_player_death():
	$"IncreaseScore".stop()
	$"EnemySpawn".stop()
	$"ItemSpawn".stop()
	
