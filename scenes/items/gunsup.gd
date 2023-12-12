extends Item

func _on_body_entered(body):
	if(Globals.amountOfGuns < 3):
		Globals.amountOfGuns += 1
		queue_free()
	else:
		pass
