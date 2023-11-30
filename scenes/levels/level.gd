extends Node2D
class_name LevelParent 

var enemies: Array[String] = [] #array of enemies to spawn. Instead of String replace with Enemy type

var player_projectile_scene: PackedScene = preload("res://scenes/projectiles/playerProjectile.tscn")

func _on_player_player_shoot(pos: Vector2) -> void:
	var player_projectile = player_projectile_scene.instantiate()
	player_projectile.position = pos
	$Projectiles.add_child(player_projectile, true)
