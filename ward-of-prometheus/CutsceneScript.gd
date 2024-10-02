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
	await get_tree().create_timer(15).timeout
	$TextureRect.texture = load("res://Textures/WardOfPrometheusSlide3V2.png")
	$Label.text = "Fueled by the power of belief from
the few temples that honored him,
he would trap the Fools who had
left him trapped there with his
flames."
	await get_tree().create_timer(15).timeout
	$TextureRect.texture = load("res://Textures/WardOfPrometheusSlide4.png")
	$Label.text = "Heroes would rise to stop him and put
out his flames, but it would only
be a matter of time till he would
have his revenge."
	await get_tree().create_timer(15).timeout
	Globals.MusicPos = get_node("MusicPlayer").get_playback_position() + AudioServer.get_time_since_last_mix()
	get_tree().change_scene_to_file("res://MainMenu.tscn")
