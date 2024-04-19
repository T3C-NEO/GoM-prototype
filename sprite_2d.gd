extends Sprite2D

var destination = Vector2.ZERO
var minDuration = 1.0
var maxDuration = 5.0
var moveTimer = 0.0
var moveSpeed = 200.0

func _ready():
	set_random_destination()
	moveTimer = randf_range(minDuration, maxDuration)

func _process(delta):
	if moveTimer > 0:
		moveTimer -= delta
		move()
	else:
		set_random_destination()
		moveTimer = randf_range(minDuration, maxDuration)

func set_random_destination():
	destination.x = randf_range(0, 1100)
	destination.y = randf_range(0, 640)

func move():
	position = position.move_toward(destination, moveSpeed)
