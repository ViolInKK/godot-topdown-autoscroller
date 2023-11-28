extends CharacterBody2D

signal player_shoot

const SPEED: int = 300
const ACEL_SPEED: int = 500

var can_shoot: bool = true


func _on_reload_timeout():
	can_shoot = true
	
func HandleShoot():
	if(Input.is_action_pressed("shoot") and can_shoot):
		emit_signal("player_shoot")
		can_shoot = false
		$Reload.start()


func HandleMovement(delta):
	var direction = Input.get_vector("left", "right", "forward", "backward")
	if(Input.is_action_pressed("acceleration")):
		position += direction * delta * ACEL_SPEED
	else:
		position += direction * delta * SPEED

func _process(delta):
	HandleShoot()
	HandleMovement(delta)
