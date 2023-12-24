extends enemy

func _ready():
	self.points = 200
	self.health = 10 + (Globals.score / 1000 )


func _on_reload_timeout():
	for n in range(-1, 2):
		var newProjectile = enemy_projectile_scene.instantiate()
		newProjectile.position = position
		newProjectile.direction = Vector2.DOWN.rotated(deg_to_rad(25 * n))
		get_node("../../Projectiles").add_child(newProjectile, true)
