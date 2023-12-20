extends enemy

func _ready():
	self.points = 200
	self.health = 10 + (Globals.score / 1000 )
