extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HSlider.value = Globals.MapSize
	$HSlider.tooltip_text = str(Globals.MapSize) + " x " + str(Globals.MapSize)


func _on_h_slider_value_changed(value: float) -> void:
	Globals.MapSize = value
	$HSlider.tooltip_text = str(Globals.MapSize) + " x " + str(Globals.MapSize)
