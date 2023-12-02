extends CharacterBody2D
class_name enemy1

signal enemy_shoot(position: Vector2)

var health: int = 5
var can_shoot: bool = true

func die() -> void:
	queue_free()

func _on_reload_timeout() -> void:
	can_shoot = true
	
func hitAnimation() -> void:
	var hitTween = get_tree().create_tween()
	hitTween.tween_property($Sprite2D, "modulate", Color(1, 0.5, 0.5, 1), 0.08)
	hitTween.tween_property($Sprite2D, "modulate", Color.WHITE, 0.08)
	
func hit() -> void:
	health -= Globals.damage
	hitAnimation()

func _process(_delta: float) -> void:
	if(health == 0):	
		die()
	if(can_shoot):
		enemy_shoot.emit(position)
		can_shoot = false
		$Reload.start()

