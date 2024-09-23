extends CharacterBody2D
var rng = RandomNumberGenerator.new()

const SPEED = 120.0
var Location2Go = position

func _ready() -> void:
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
	var MoveVectorAbs = sqrt(pow(Location2Go.x,2) + pow(Location2Go.y,2))
	MoveVector = Vector2(MoveVector.x/MoveVectorAbs,MoveVector.y/MoveVectorAbs)
	velocity = MoveVector * SPEED
	move_and_slide()
	
	velocity = velocity / 100
	if sqrt(pow(velocity.x,2) + pow(velocity.y,2)) < 10:
		velocity = Vector2(0,0)


func _on_fire_detect_body_entered(body: Node2D) -> void:
	if body.is_in_group("Fire"):
		Location2Go = Vector2(rng.randf_range((Globals.MapSize - 1) * -16, (Globals.MapSize - 1) * 16),rng.randf_range((Globals.MapSize - 1) * -16, (Globals.MapSize - 1) * 16))
