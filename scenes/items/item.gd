extends Area2D
class_name Item

const ITEM_SPEED: int = 100

func _on_body_entered(body) -> void:
	print("Picked up power up")
	queue_free()

func _on_despawn_timer_timeout() -> void:
	queue_free()
	
func _process(delta: float) -> void:
	position += delta * Vector2.DOWN * ITEM_SPEED
