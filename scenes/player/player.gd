extends CharacterBody2D

signal player_shoot(position: Vector2)

const ACCEL: int = 2800
const FRICTION: int = 2000
const MAX_SPEED: int = 300
const MAX_ACEL_SPEED: int = 400

var canShoot: bool = true

func hit() -> void:
	print("player got hit")
	print(Globals.health)

func _on_reload_timeout() -> void:
	canShoot = true
	
func HandleShoot() -> void:
	if(Input.is_action_pressed("shoot") and canShoot):
		player_shoot.emit($Marker2D.global_position)
		canShoot = false
		$Reload.start()

func HandleMovement(delta: float) -> void:
	var direction: Vector2 = Input.get_vector("left", "right", "forward", "backward")
	if (direction == Vector2.ZERO):
		if(velocity.length() > (FRICTION * delta)): 
			velocity -= velocity.normalized() * (FRICTION * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += direction * ACCEL * delta
		if(Input.is_action_pressed("acceleration")):
			velocity = velocity.limit_length(MAX_ACEL_SPEED)
		else:
			velocity = velocity.limit_length(MAX_SPEED)
	move_and_slide()
	
func _process(delta: float) -> void:
	HandleShoot()
	HandleMovement(delta)

