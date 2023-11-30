extends Area2D

const PLYAER_PROJECTILE_SPEED: int = 700

func _process(delta: float) -> void:
	position.y -= delta * PLYAER_PROJECTILE_SPEED
	


func _on_despawn_timer_timeout() -> void:
	queue_free()


func _on_body_entered(body):
	body.hit()
	queue_free()
