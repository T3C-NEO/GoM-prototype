extends AnimatedSprite2D


var destination = Vector2.ZERO
var minDuration = 1.0
var maxDuration = 1.5
var moveTimer = 0.0
var moveSpeed = 10.0


@onready var ads = [$"WeNeedYouToWork-WorkAd", $Blank1,$Blank3];

func _ready():
	var i = randi_range(0,2)
	ads[i].visible = true;
	set_random_destination()
	moveTimer = randf_range(minDuration, maxDuration)

func _process(delta: float) -> void:
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
	if moveTimer > 0:
		var direction = (destination - position).normalized()
		var distance = (destination - position).length()
		var timeToReach = (distance / moveSpeed)+1
		var velocity = direction * (distance / timeToReach)
		position += velocity

func _on_button_pressed() -> void:
	Game.works -= 1;
	queue_free();

func _on_button_2_pressed() -> void:
	pass
