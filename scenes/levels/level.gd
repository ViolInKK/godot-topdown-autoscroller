extends Node2D

var player_projectile_scene: PackedScene = preload("res://scenes/projectiles/playerProjectile.tscn")

func _on_player_player_shoot():
	var player_projectile = player_projectile_scene.instantiate()
	player_projectile.position = $Player.position
	add_child(player_projectile)
