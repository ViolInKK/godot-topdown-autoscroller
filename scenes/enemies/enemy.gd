extends CharacterBody2D
class_name enemy

signal enemy_shoot(position: Vector2)

@onready var startingPosition: Vector2 = position
@onready var rotationDirection: bool = randi_range(0, 1)

const MAX_RADIUS: float = 5.0
const ROTATION_SPEED: float = 5.0
var d: float = 0.0
var radius: float = 3.0

var points: int
var health: int

func die() -> void:
	Globals.score += points
	queue_free()

func _on_reload_timeout() -> void:
	enemy_shoot.emit(position)
	$Reload.start()
	
func hitAnimation() -> void:
	var hitTween = get_tree().create_tween()
	#Red blinking animation
	hitTween.tween_property($Sprite2D, "modulate", Color(1, 0.5, 0.5, 1), 0.08)
	hitTween.tween_property($Sprite2D, "modulate", Color.WHITE, 0.08)
	
func moveInAnimaion() -> void:
	var moveInTween = get_tree().create_tween()
	#Slowly move into the camera animation
	moveInTween.tween_property($".", "position", Vector2($".".position.x, $".".position.y + 50), 0.5)

func hit() -> void:
	health -= Globals.damage
	if(health <= 0):
		die()
		return
	hitAnimation()
	
func _process(delta: float) -> void:
	if(rotationDirection):
		d += delta
	else:
		d -= delta
		
	if(randi_range(0,1)):
		radius += 0.1
		position = Vector2(sin(d * ROTATION_SPEED) * min(MAX_RADIUS, abs(radius))+2, 
				cos(d * ROTATION_SPEED) * min(MAX_RADIUS, abs(radius))+2) + Vector2(startingPosition.x, startingPosition.y + 50)
	else:
		radius -= 0.1
		position = Vector2(sin(d * ROTATION_SPEED) * min(MAX_RADIUS, abs(radius))+2, 
				cos(d * ROTATION_SPEED) * min(MAX_RADIUS, abs(radius))+2) + Vector2(startingPosition.x, startingPosition.y + 50)
		
