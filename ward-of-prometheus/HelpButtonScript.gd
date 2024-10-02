extends Button
var HelpOn = false



func _on_pressed() -> void:
	match HelpOn:
		true:
			HelpOn = false
			get_parent().get_node("Label").visible = false
			get_parent().get_node("HBoxContainer").visible = false
			text = "Show Help"
		false:
			HelpOn = true
			get_parent().get_node("Label").visible = true
			get_parent().get_node("HBoxContainer").visible = true
			text = "Hide Help"
