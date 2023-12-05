extends Item

func _on_body_entered(body):
	if(Globals.health == 3):
		return
	Globals.health += 1 
	queue_free()
