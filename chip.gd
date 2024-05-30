extends RigidBody2D

var move : bool;
var drop : bool;
var stop : bool;

var speed : float = 1500.0;

func _ready() -> void:
	self.gravity_scale = 0;


func _process(delta: float) -> void:
	#adds sliders to ceo level
	if(Game.sliders_active):
		if(position.y > 3100 && drop && !stop):
			stop = true;
			self.freeze = true;
	
	if(drop && !stop):
		self.gravity_scale = 1.5;
	elif(!stop):
		new_drop_point(delta);
		
	boundaries_for_final_plinko();
		
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

func new_drop_point(delta : float) -> void:
	position.x += speed * delta;
	
	if(position.x < 65 || position.x > 1085):
		speed *= -1;

func boundaries_for_final_plinko():
	#sets, ummm, the boundaries for final plinko
	if(position.x < 0):
		position.x = 1150;
	if(position.x > 1150):
		position.x = 0;
