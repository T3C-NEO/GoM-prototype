extends Node2D


@onready var ghost = $Ghost;
@onready var play = $play;
@onready var after_thought = $jordan_done;


var show_thoughts : bool; 
var near_elevator : bool;


func _ready() -> void:
	play.visible = false;
	after_thought.visible = false;


func _process(_delta: float) -> void:
	if(!Game.demoDone):
		play.visible = show_thoughts;
	else:
		after_thought.visible = show_thoughts;


func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name == "Ghost"):
		show_thoughts = true;


func _on_area_2d_body_exited(body: Node2D) -> void:
	if(body.name == "Ghost"):
		show_thoughts = false;


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://plinko_3.tscn");


func _on_elevator_button_pressed() -> void:
	if(Game.demoDone && near_elevator):
		get_tree().change_scene_to_file("res://loading3.tscn");


func _on_elevator_detection_body_entered(body: Node2D) -> void:
	if(body.name == "Ghost"):
		near_elevator = true;


func _on_elevator_detection_body_exited(body: Node2D) -> void:
	if(body.name == "Ghost"):
		near_elevator = false;
