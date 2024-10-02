extends AudioStreamPlayer
var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var Music2Play = rng.randi_range(0,1)
	match Music2Play:
		0:
			stream = load("res://SFX/Ward of Prometheis - Gameplay_A.wav")
		1:
			stream = load("res://SFX/Ward of Prometheis - Gameplay_B.wav")
	play()

func _on_finished() -> void:
	if Globals.FoolsTrapped != Globals.FoolsNeeded:
		var Music2Play = rng.randi_range(0,1)
		match Music2Play:
			0:
				stream = load("res://SFX/Ward of Prometheis - Gameplay_A.wav")
			1:
				stream = load("res://SFX/Ward of Prometheis - Gameplay_B.wav")
	else:
		stream = load("res://SFX/Ward of Prometheis - GameOver.wav")
	play()
