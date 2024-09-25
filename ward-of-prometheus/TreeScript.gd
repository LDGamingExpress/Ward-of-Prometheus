extends StaticBody2D
var FireObj = preload("res://Fire.tscn")
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func Burn():
	await get_tree().create_timer(rng.randf_range(1,2.5)).timeout
	var NewFire = FireObj.instantiate()
	NewFire.position = position
	get_parent().add_child(NewFire)
	queue_free()
