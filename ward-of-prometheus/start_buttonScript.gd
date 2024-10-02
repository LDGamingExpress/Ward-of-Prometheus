extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.FoolsTrapped = 0
	Globals.FoolTotal = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	Globals.MusicPos = get_parent().get_parent().get_node("MusicPlayer").get_playback_position() + AudioServer.get_time_since_last_mix()
	get_tree().change_scene_to_file("res://GameOptions.tscn")
