extends CharacterBody2D

signal enemy_shoot(position: Vector2)

var can_shoot: bool = true

func _on_reload_timeout() -> void:
	can_shoot = true
	
func hit() -> void:
	print('enemy took damage')

func _process(_delta: float) -> void:
	if(can_shoot):
		enemy_shoot.emit(position)
		can_shoot = false
		$Reload.start()

