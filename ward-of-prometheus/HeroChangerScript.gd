extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HSlider.value = Globals.HeroesNeeded
	$HSlider.tooltip_text = str(Globals.HeroesNeeded) + " Heroes"


func _on_h_slider_value_changed(value: float) -> void:
	Globals.HeroesNeeded = value
	$HSlider.tooltip_text = str(Globals.HeroesNeeded) + " Heroes"
