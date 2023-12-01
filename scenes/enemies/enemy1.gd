extends CharacterBody2D

signal enemy_shoot(position: Vector2)

var health: int = 5
var can_shoot: bool = true

func die() -> void:
	queue_free()

func _on_reload_timeout() -> void:
	can_shoot = true
	
func hit() -> void:
	health -= Globals.damage

func _process(_delta: float) -> void:
	if(health == 0):
		die()
	if(can_shoot):
		enemy_shoot.emit(position)
		can_shoot = false
		$Reload.start()

