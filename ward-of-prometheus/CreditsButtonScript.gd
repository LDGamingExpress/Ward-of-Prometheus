extends Button



func _on_pressed() -> void:
	Globals.MusicPos = get_parent().get_parent().get_node("MusicPlayer").get_playback_position() + AudioServer.get_time_since_last_mix()
	get_tree().change_scene_to_file("res://Credits.tscn")
