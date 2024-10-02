extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HSlider.value = Globals.FoolsNeeded
	$HSlider.tooltip_text = str(Globals.FoolsNeeded) + " Fools"


func _on_h_slider_value_changed(value: float) -> void:
	Globals.FoolsNeeded = value
	$HSlider.tooltip_text = str(Globals.FoolsNeeded) + " Fools"
