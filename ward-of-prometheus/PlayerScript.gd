extends CharacterBody2D

var FireObj = preload("res://Fire.tscn")

const SPEED = 300.0
var LastFirePos = Vector2(10000000,10000000)

func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("Left"):
		velocity.x -= SPEED
	if Input.is_action_pressed("Right"):
		velocity.x += SPEED
	if Input.is_action_pressed("Up"):
		velocity.y -= SPEED
	if Input.is_action_pressed("Down"):
		velocity.y += SPEED
	if Input.is_action_pressed("FireMake") and Globals.Mana >= 1 and sqrt(pow(LastFirePos.x - get_global_mouse_position().x,2) + pow(LastFirePos.y - get_global_mouse_position().y,2)) > 10:
		LastFirePos = get_global_mouse_position()
		Globals.Mana -= 1
		var NewFire = FireObj.instantiate()
		NewFire.position = get_global_mouse_position()
		get_parent().add_child(NewFire)

	move_and_slide()
	
	velocity.x = velocity.x / 100
	velocity.y = velocity.y / 100
	if velocity.y < 10:
		velocity.y = 0
	if velocity.x < 10:
		velocity.x = 0
	$Camera2D/CanvasLayer/HBoxContainer/VBoxContainer2/FoolsToTrapN.text = str(Globals.FoolTotal - Globals.FoolsTrapped)
	$Camera2D/CanvasLayer/HBoxContainer/VBoxContainer2/FoolsTrappedN.text = str(Globals.FoolsTrapped)
	$Camera2D/CanvasLayer/HBoxContainer/HBoxContainer/Label.text = "Mana:\n" + str(Globals.Mana) + "/" + str(Globals.ManaMax)
