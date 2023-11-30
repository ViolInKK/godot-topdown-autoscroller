extends LevelParent

var enemy_projectile_scene: PackedScene = preload("res://scenes/projectiles/enemyProjectile.tscn")

func _on_enemy_1_enemy_shoot(pos: Vector2) -> void:
	for n in range(-1, 2):
		var enemy_projectile = enemy_projectile_scene.instantiate()
		enemy_projectile.position = pos
		enemy_projectile.direction = Vector2.DOWN.rotated(deg_to_rad(25 * n))
		$Projectiles.add_child(enemy_projectile, true)
