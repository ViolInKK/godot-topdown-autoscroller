extends Node

signal health_change
signal score_update
signal sheild_change

var score: int = 0:
	get:
		return score
	set(value):
		score = value
		score_update.emit()

var health: int = 3:
	get:
		return health
	set(value): 
		health = value
		health_change.emit()

var damage: int = 1:
	get:
		return damage
	set(value):
		damage = value
		
var amountOfGuns: int = 1:
	get:
		return amountOfGuns
	set(value):
		amountOfGuns = value

var isSheild: bool = false:
	get:
		return isSheild
	set(value):
		isSheild = value
		sheild_change.emit()
