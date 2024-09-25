extends StaticBody2D
var FireObj = preload("res://Fire.tscn")
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func Burn():
	await get_tree().create_timer(rng.randf_range(1,2.5)).timeout
	var NewFire = FireObj.instantiate()
	NewFire.position = position + Vector2(rng.randf_range(-10,10),rng.randf_range(-10,10))
	get_parent().add_child(NewFire)
	var NewFire2 = FireObj.instantiate()
	NewFire2.position = position + Vector2(rng.randf_range(-10,10),rng.randf_range(-10,10))
	get_parent().add_child(NewFire2)
	queue_free()
