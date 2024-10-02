extends Button


func _on_pressed() -> void:
	Globals.MusicPos = 0.0
	get_tree().paused = false
	get_tree().change_scene_to_file("res://MainMenu.tscn")
