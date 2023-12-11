extends CharacterBody2D

signal player_shoot(position: Vector2)
signal player_death

const ACCEL: int = 2800
const FRICTION: int = 2000
const MAX_SPEED: int = 300
const MAX_ACEL_SPEED: int = 400
const SKEW_RAD_DELTA = 1.1
const MAX_SKEW = 20

var IFrames: bool = false
var canShoot: bool = true

func _ready():
	Globals.connect("sheild_change", shieldChange)
	
func _on_reload_timeout() -> void:
	canShoot = true
	
func _on_i_framers_timeout() -> void:
	IFrames = false
	
func shieldChange() -> void:
	$"Shield".visible = true

func IFramesAnimation() -> void:
	var IFramesTween = get_tree().create_tween()
	for n in range(2):
		IFramesTween.tween_property($Player, "modulate", Color(1,1,1,0.5), 0.25)
		IFramesTween.tween_property($Player, "modulate", Color.WHITE, 0.25)
	
func hit() -> void:
	if(Globals.isSheild):
		IFrames = true
		$IFramers.start()
		IFramesAnimation()
		Globals.isSheild = false
		$"Shield".visible = false
	if(not IFrames and not Globals.isSheild):
		Globals.health -= 1
		Globals.damage = 1
		Globals.amountOfGuns = 1
		IFrames = true
		$IFramers.start()
		IFramesAnimation()
	if(Globals.health <= 0):
		player_death.emit()
		queue_free()
		
func HandleShoot() -> void:
	if(Input.is_action_pressed("shoot") and canShoot):
		player_shoot.emit($Marker2D.global_position)
		canShoot = false
		$Reload.start()
		
func handleSkew(direction: Vector2) -> void:
	if(direction == Vector2.ZERO):
		if($"Player".skew > 0 and $"Player".rotation < 0):
			$"Player".skew = max(deg_to_rad(0), $"Player".skew - deg_to_rad(SKEW_RAD_DELTA))
			$"Player".rotation = min(deg_to_rad(0), $"Player".rotation + deg_to_rad(SKEW_RAD_DELTA))
		else:
			$"Player".skew = min(deg_to_rad(0), $"Player".skew + deg_to_rad(SKEW_RAD_DELTA))
			$"Player".rotation = max(deg_to_rad(0), $"Player".rotation - deg_to_rad(SKEW_RAD_DELTA))
	#Left skew
	if(direction.x < 0):
		$"Player".skew = min(deg_to_rad(MAX_SKEW), $"Player".skew + deg_to_rad(SKEW_RAD_DELTA))
		$"Player".rotation = max(deg_to_rad(-MAX_SKEW), $"Player".rotation - deg_to_rad(SKEW_RAD_DELTA))
	#Right skew
	if(direction.x > 0):
		$"Player".skew = max(deg_to_rad(-MAX_SKEW), $"Player".skew - deg_to_rad(SKEW_RAD_DELTA))
		$"Player".rotation = min(deg_to_rad(MAX_SKEW), $"Player".rotation + deg_to_rad(SKEW_RAD_DELTA))		
		
	

func HandleMovement(delta: float) -> void:
	var direction: Vector2 = Input.get_vector("left", "right", "forward", "backward")
	if(direction == Vector2.ZERO):
		if(velocity.length() > (FRICTION * delta)):
			velocity -= velocity.normalized() * (FRICTION * delta)
		else:
			return
	else:
		velocity += direction * ACCEL * delta
		if(Input.is_action_pressed("acceleration")):
			velocity = velocity.limit_length(MAX_ACEL_SPEED)
		else:
			velocity = velocity.limit_length(MAX_SPEED)
	handleSkew(direction)
	move_and_slide()
	
func _process(delta: float) -> void:
	HandleShoot()
	HandleMovement(delta)




