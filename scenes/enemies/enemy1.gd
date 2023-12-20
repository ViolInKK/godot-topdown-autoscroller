extends enemy

func _ready():
	self.points = 50
	self.health = 5 + (Globals.score / 1000 )
