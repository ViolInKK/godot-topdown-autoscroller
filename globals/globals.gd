extends Node

signal health_change

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
