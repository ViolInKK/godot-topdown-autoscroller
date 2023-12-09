extends Item

func _on_body_entered(_body):
	Globals.damage += 1
	queue_free()
