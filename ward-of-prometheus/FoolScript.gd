extends CharacterBody2D
var rng = RandomNumberGenerator.new()
var TestObj = preload("res://TestObject.tscn")

const SPEED = 30.0
var Location2Go = position
var TimeSinceHitFire = 100
var trapped = false

func _ready() -> void:
	Globals.FoolTotal += 1
	Location2Go = Vector2(rng.randf_range((Globals.MapSize - 1) * -16, (Globals.MapSize - 1) * 16),rng.randf_range((Globals.MapSize - 1) * -16, (Globals.MapSize - 1) * 16))
	var Sprite2Use = rng.randi_range(1,3)
	match Sprite2Use:
		1:
			$Sprite2D.texture = load("res://Textures/FantasyScholarSmall.png")
		2:
			$Sprite2D.texture = load("res://Textures/GreekGirlSmall.png")
		3:
			$Sprite2D.texture = load("res://Textures/PhilosopherSmall.png")


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
		if 10 - $Timer.time_left < 5 and trapped == false:
			Globals.FoolsTrapped += 1
			trapped = true
		TimeSinceHitFire = 10 - $Timer.time_left
		#if body.is_in_group("Fire"):
		velocity = Vector2(0,0)
		Location2Go = (-body.global_position + position) / sqrt(pow((body.global_position.x - position.x),2) + pow((body.global_position.y - position.y),2)) * 200 + position
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
		if body.is_in_group("Fire"):
			$Timer.start()
	if body.is_in_group("Ground"):
		if 10 - $Timer.time_left < 5 and trapped == false:
			Globals.FoolsTrapped += 1
			trapped = true
		TimeSinceHitFire = 10 - $Timer.time_left
		#if body.is_in_group("Fire"):
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


func _on_timer_timeout() -> void:
	#print("TimerDone")
	#print(TimeSinceHitFire)
	if trapped == true:
		trapped = false
		Globals.FoolsTrapped -= 1
		#print("Freed" + str(Globals.FoolsTrapped))
	TimeSinceHitFire = 10
