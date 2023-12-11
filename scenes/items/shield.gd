extends Item

func _on_body_entered(_body):
	if(!Globals.isSheild):
		Globals.isSheild = true
		queue_free()
	else:
		pass
