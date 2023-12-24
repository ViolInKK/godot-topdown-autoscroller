extends enemy

func _ready():
	self.points = 50
	self.health = 5 + (Globals.score / 1000 )


func _on_reload_timeout():
	var newProjectile = enemy_projectile_scene.instantiate()
	newProjectile.position = position
	newProjectile.direction = Vector2.DOWN
	get_node("../../Projectiles").add_child(newProjectile, true)
	enemy_shoot.emit(position)
	$Reload.start()
