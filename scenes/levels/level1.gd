extends LevelParent

var enemy_projectile_scene: PackedScene = preload("res://scenes/projectiles/enemyProjectile.tscn")
var enemy: PackedScene = preload("res://scenes/enemies/enemy1.tscn")
var healthupItem: PackedScene = preload("res://scenes/items/healthup.tscn")
var dmgupItem: PackedScene = preload("res://scenes/items/dmgup.tscn")
var shieldItem: PackedScene = preload("res://scenes/items/shield.tscn")
var gunsupItem: PackedScene = preload("res://scenes/items/gunsup.tscn")

var enemies = [enemy]
var items = [healthupItem, dmgupItem, shieldItem, gunsupItem]


func _on_enemy_1_enemy_shoot(pos: Vector2) -> void:
	for n in range(-1, 2):
		var enemy_projectile = enemy_projectile_scene.instantiate()
		enemy_projectile.position = pos
		enemy_projectile.direction = Vector2.DOWN.rotated(deg_to_rad(25 * n))
		$Projectiles.add_child(enemy_projectile, true)

func _on_item_spawn_timeout():
	var newItem: Item = items.pick_random().instantiate()
	newItem.position = Vector2(randi_range(50, int(get_viewport_rect().size.x) - 50), -30)
	$Items.add_child(newItem, true)

func _on_enemy_spawn_timeout():
	var newEnemy: enemy1 = enemy.instantiate()
	newEnemy.position = Vector2(randi_range(50, int(get_viewport_rect().size.x) - 50), randi()%10+20)
	newEnemy.enemy_shoot.connect(self._on_enemy_1_enemy_shoot)
	$Enemies.add_child(newEnemy, true)
