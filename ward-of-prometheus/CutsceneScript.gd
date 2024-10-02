extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(15).timeout
	$TextureRect.texture = load("res://Textures/WardOfPrometheusSlide2.png")
	$Label.text = "One day, he broke free from his shackles.
Beset by his rage for those who
failed to save him, Prometheus
set out to take his revenge
using the very gift he gave to
them."
	
