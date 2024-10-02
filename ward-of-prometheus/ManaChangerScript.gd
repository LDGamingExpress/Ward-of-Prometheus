extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HSlider.value = Globals.ManaMax
	$HSlider.tooltip_text = str(Globals.ManaMax) + " Mana"


func _on_h_slider_value_changed(value: float) -> void:
	Globals.ManaMax = value
	$HSlider.tooltip_text = str(Globals.ManaMax) + " Mana"
