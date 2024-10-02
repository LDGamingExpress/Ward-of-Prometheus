extends TextureButton

func _on_pressed() -> void:
	if get_tree().paused == true:
		get_tree().paused = false
		get_parent().get_node("MainMenuButton").visible = false
		get_parent().get_node("ExitButton").visible = false
	else:
		get_tree().paused = true
		get_parent().get_node("MainMenuButton").visible = true
		get_parent().get_node("ExitButton").visible = true
