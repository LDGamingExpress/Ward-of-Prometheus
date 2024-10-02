extends AudioStreamPlayer

func _ready() -> void:
	play(Globals.MusicPos)

func _on_finished() -> void:
	play()
