extends LevelParent

var enemy_projectile_scene: PackedScene = preload("res://scenes/projectiles/enemyProjectile.tscn")
var enemy1: PackedScene = preload("res://scenes/enemies/enemy1.tscn")

var enemies = [enemy1, enemy1, enemy1]

func _on_enemy_1_enemy_shoot(pos: Vector2) -> void:
	for n in range(-1, 2):
		var enemy_projectile = enemy_projectile_scene.instantiate()
		enemy_projectile.position = pos
		enemy_projectile.direction = Vector2.DOWN.rotated(deg_to_rad(25 * n))
		$Projectiles.add_child(enemy_projectile, true)

func _on_timer_timeout():
	var newEnemy: enemy1 = enemy1.instantiate()
	newEnemy.position = Vector2(randi()%450, randi()%100)
	newEnemy.enemy_shoot.connect(self._on_enemy_1_enemy_shoot)
	$Enemies.add_child(newEnemy, true)
	#for enemy in enemies:
		#var newEnemy: enemy1 = enemy.instantiate()
		#newEnemy.position = Vector2(randi()%450, randi()%100)
		#newEnemy.enemy_shoot.connect(self._on_enemy_1_enemy_shoot)
		#$Enemies.add_child(newEnemy, true)

