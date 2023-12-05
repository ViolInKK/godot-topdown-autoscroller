extends Item

func _on_body_entered(body):
	Globals.damage += 1
	queue_free()
