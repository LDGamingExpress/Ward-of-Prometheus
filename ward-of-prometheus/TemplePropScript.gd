extends StaticBody2D
var ManaObj = preload("res://ManaReplenish.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if sqrt(pow(position.x - get_global_mouse_position().x,2) + pow(position.y - get_global_mouse_position().y,2)) < 20:
		if Globals.Mana < Globals.ManaMax:
			Globals.Mana += 1
			var ManaNew = ManaObj.instantiate()
			ManaNew.position = position
			ManaNew.restart()
			get_parent().add_child(ManaNew)
