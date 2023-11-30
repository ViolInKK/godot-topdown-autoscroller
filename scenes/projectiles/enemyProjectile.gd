extends Area2D

const ENEMY_PROJECTILE_SPEED: int = 300

var direction: Vector2

func _process(delta: float):
	position += delta * direction * ENEMY_PROJECTILE_SPEED 
	
func _on_despawn_timer_timeout() -> void:
	queue_free()


func _on_body_entered(body):
	body.hit()
	queue_free()
