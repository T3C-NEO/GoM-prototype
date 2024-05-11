extends RigidBody2D

var move : bool;
var drop : bool;

func _ready() -> void:
	self.gravity_scale = 0;


func _process(_delta: float) -> void:
	if(drop):
		self.gravity_scale = 1.5;
	else:
		set_drop_point();
		
func set_drop_point() -> void:
	var mouse : Vector2 = get_global_mouse_position();
	
	if(Input.is_action_pressed("mouse_left") && mouse.y > 200):
		move = true;
	elif(Input.is_action_just_released("mouse_left")):
		move = false;
	
	if(move):
		position.x = mouse.x;
	
	if(position.x < 65):
		position.x = 65;
	elif(position.x > 1085):
		position.x = 1085;

