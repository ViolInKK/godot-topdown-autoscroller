extends Area2D

const PLYAER_PROJECTILE_SPEED = 500

func _process(delta):
	position.y -= delta * PLYAER_PROJECTILE_SPEED
	


func _on_despawn_timer_timeout():
	queue_free()
