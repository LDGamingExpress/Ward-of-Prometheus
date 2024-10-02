extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var viewportWidth = DisplayServer.window_get_size().x
	var viewportHeight = DisplayServer.window_get_size().y
	#var viewportHeight = get_viewport().size.y

	var scaleN = viewportWidth / texture.get_size().x

	# Optional: Center the sprite, required only if the sprite's Offset>Centered checkbox is set

	# Set same scale value horizontally/vertically to maintain aspect ratio
	# If however you don't want to maintain aspect ratio, simply set different
	# scale along x and y
	set_scale(Vector2(scaleN, scaleN))
	set_position(Vector2(0, (viewportHeight - (texture.get_size().y * scaleN))/2))
