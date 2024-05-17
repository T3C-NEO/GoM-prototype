extends CharacterBody2D
 
var speed = 600
var mouse_position = null
 
func _physics_process(_delta):
	
	# Reset the player's velocity
	velocity = Vector2(0, 0)
	mouse_position = get_global_mouse_position()
 
	# This input will need to be created in the input map
	if Input.is_action_pressed("forward"):
		var direction = (mouse_position - position).normalized()
		velocity = (direction * speed)
	
	move_and_slide()
	look_at(mouse_position)

# Called when the node enters the scene tree for the first time.
