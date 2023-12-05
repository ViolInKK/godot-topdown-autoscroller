extends HBoxContainer

var fullHeart: CompressedTexture2D = preload("res://assets/graphics/ui/heart-full.png")
var emptyHeart: CompressedTexture2D = preload("res://assets/graphics/ui/heart-empty.png")

func _ready():
	Globals.connect("health_change", update_health)
	instanciate_health()

func instanciate_health() -> void:
	for i in Globals.health:
		var heart = TextureRect.new()
		heart.texture = fullHeart
		heart.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		$".".add_child(heart, true)
		
func update_health() -> void:
	var heartContainers = $".".get_children()
	for i in heartContainers.size():
		if(i < Globals.health):
			heartContainers[i].texture = fullHeart
		else:
			heartContainers[i].texture = emptyHeart

