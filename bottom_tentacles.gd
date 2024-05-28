extends Node2D

@onready var start_pos : Vector2 = position;
@onready var screen_covered : bool; 
@onready var start_moving : bool;

func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	if(position.y < -350.0):
		screen_covered = true;

	move(delta);


func move(delta : float) -> void:
	if(Game.left_active || Game.right_active):
		position.y -= 10 * delta; 
	elif(position.y < start_pos.y):
		position.y += 20 * delta;
