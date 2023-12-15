extends CharacterBody2D
class_name enemy

signal enemy_shoot(position: Vector2)

var health: int = 5
var can_shoot: bool = false

func die() -> void:
	Globals.score += 100
	queue_free()

func _on_reload_timeout() -> void:
	can_shoot = true
	
func hitAnimation() -> void:
	if(health <= 0):
		return
	var hitTween = get_tree().create_tween()
	#Red blinking animation
	hitTween.tween_property($Sprite2D, "modulate", Color(1, 0.5, 0.5, 1), 0.08)
	hitTween.tween_property($Sprite2D, "modulate", Color.WHITE, 0.08)
	
func hit() -> void:
	health -= Globals.damage
	hitAnimation()

func _process(_delta: float) -> void:
	if(health <= 0):	
		die()
	if(can_shoot):
		enemy_shoot.emit(position)
		can_shoot = false
		$Reload.start()
