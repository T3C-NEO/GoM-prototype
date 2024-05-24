extends Node2D

@onready var start_pos : Vector2 = position;
@onready var screen_covered : bool; 

func _ready() -> void:
	pass # Replace with function body.



func _process(delta: float) -> void:
	if(position.y < -350.0):
		screen_covered = true;
	
	if(!Game.left_active || !Game.right_active):
		position.y -= 10 * delta; 
	elif(position.y < start_pos.y):
		position.y += 20 * delta;
