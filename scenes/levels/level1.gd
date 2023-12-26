extends LevelParent

var enemy1: PackedScene = preload("res://scenes/enemies/enemy1.tscn")
var enemy2: PackedScene = preload("res://scenes/enemies/enemy2.tscn")
var healthupItem: PackedScene = preload("res://scenes/items/healthup.tscn")
var dmgupItem: PackedScene = preload("res://scenes/items/dmgup.tscn")
var shieldItem: PackedScene = preload("res://scenes/items/shield.tscn")
var gunsupItem: PackedScene = preload("res://scenes/items/gunsup.tscn")

const MAX_DIFFICULTY = 1

var difficulty: int = 0
var enemies = [
		[enemy1],
		[enemy1, enemy2],
		[enemy2],
	]
var items = [healthupItem, dmgupItem, shieldItem, gunsupItem]

func _on_item_spawn_timeout():
	var newItem: Item = items.pick_random().instantiate()
	newItem.position = Vector2(randi_range(50, int(get_viewport_rect().size.x) - 50), -30)
	$Items.add_child(newItem, true)
	
func handle_difficulty_change() -> void:
	$EnemySpawn.wait_time = max(2.5 - snapped(float(Globals.score / 2000) / 3, 0.1), 1)
	maxAmountOfEnemies = min((Globals.score / 3000) + 3, 6) 
	difficulty = min(enemies.size() - 1, Globals.score / 2000)

func _on_enemy_spawn_timeout():
	handle_difficulty_change()
	var newEnemy: enemy = enemies[min(MAX_DIFFICULTY, Globals.score / 2000)].pick_random().instantiate()
	newEnemy.position = Vector2(randi_range(50, int(get_viewport_rect().size.x) - 50), randi()%10-20)
	$Enemies.add_child(newEnemy, true)
	newEnemy.moveInAnimaion()
