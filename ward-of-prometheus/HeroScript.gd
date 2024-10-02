extends CharacterBody2D
var rng = RandomNumberGenerator.new()
var TestObj = preload("res://TestObject.tscn")
var ExtinguishObj = preload("res://FireExtinguished.tscn")

const SPEED = 30.0
var Location2Go = position
var TimeSinceHitFire = 100
var trapped = false
var FiresFound = []

func _ready() -> void:
	#Globals.FoolTotal += 1
	Location2Go = Vector2(rng.randf_range((Globals.MapSize - 1) * -16, (Globals.MapSize - 1) * 16),rng.randf_range((Globals.MapSize - 1) * -16, (Globals.MapSize - 1) * 16))
	var Sprite2Use = rng.randi_range(1,3)
	match Sprite2Use:
		1:
			$Sprite2D.texture = load("res://Textures/Greek_Roman_Soldier(Small).png")
		2:
			$Sprite2D.texture = load("res://Textures/Greek_Roman_Water(Small).png")
		3:
			$Sprite2D.texture = load("res://Textures/PegasusSmall.png")


func _physics_process(delta: float) -> void:
	if sqrt(pow(position.x - Location2Go.x,2) + pow(position.y - Location2Go.y,2)) < 20:
		Location2Go = Vector2(rng.randf_range((Globals.MapSize - 1) * -16, (Globals.MapSize - 1) * 16),rng.randf_range((Globals.MapSize - 1) * -16, (Globals.MapSize - 1) * 16))
	var MoveVector = Location2Go - position
	var MoveVectorAbs = sqrt(pow(MoveVector.x,2) + pow(MoveVector.y,2))
	MoveVector = Vector2(MoveVector.x/MoveVectorAbs,MoveVector.y/MoveVectorAbs)
	velocity = MoveVector * SPEED
	move_and_slide()
	
	velocity = velocity / 100
	if sqrt(pow(velocity.x,2) + pow(velocity.y,2)) < 10:
		velocity = Vector2(0,0)


func _on_fire_detect_body_entered(body: Node2D) -> void:
	if body.is_in_group("Colliders") and body != self:
		if body.is_in_group("Fire"):
			Location2Go = body.position
			FiresFound.append(body)


func _on_fire_put_out_detect_body_entered(body: Node2D) -> void:
	if body.is_in_group("Fire"):
		var NewObj = ExtinguishObj.instantiate()
		NewObj.position = body.position
		NewObj.restart()
		get_parent().add_child(NewObj)
		if body.position == Location2Go:
			FiresFound.erase(body)
			if len(FiresFound) > 0:
				Location2Go = FiresFound[rng.randi_range(0,len(FiresFound) - 1)].position
			else:
				Location2Go = Vector2(rng.randf_range((Globals.MapSize - 1) * -16, (Globals.MapSize - 1) * 16),rng.randf_range((Globals.MapSize - 1) * -16, (Globals.MapSize - 1) * 16))
		body.queue_free()
	if body.is_in_group("Ground"):
		velocity = Vector2(0,0)
		Location2Go = Vector2(rng.randf_range(-(Globals.MapSize-1)/2 * 32,(Globals.MapSize-1)/2 * 32),rng.randf_range(-(Globals.MapSize-1)/2 * 32,(Globals.MapSize-1)/2 * 32))
		#var TestO = TestObj.instantiate()
		#TestO.position = Location2Go
		#TestO.scale = Vector2(0.1,0.1)
		#get_parent().add_child(TestO)
		var MoveVector = Location2Go - position
		var MoveVectorAbs = sqrt(pow(MoveVector.x,2) + pow(MoveVector.y,2))
		MoveVector = Vector2(MoveVector.x/MoveVectorAbs,MoveVector.y/MoveVectorAbs)
		velocity = MoveVector * SPEED * 10
		move_and_slide()
		velocity = Vector2(0,0)
		#get_tree().paused = true


func _on_fire_detect_body_exited(body: Node2D) -> void:
	if body.is_in_group("Colliders") and body != self:
		if body.is_in_group("Fire"):
			FiresFound.erase(body)
