extends Node

var health: int = 3:
	get:
		return health
	set(value): 
		health += value

var damage: int = 1:
	get:
		return damage
	set(value):
		health += value
		
var amountOfGuns: int = 1:
	get:
		return amountOfGuns
	set(value):
		health += value
