extends Node2D


@onready var ghost = $Ghost;
@onready var play = $play; 

var show_thoughts : bool; 


func _ready() -> void:
	play.visible = false;


func _process(delta: float) -> void:
	play.visible = show_thoughts; 


func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name == "Ghost"):
		show_thoughts = true;


func _on_area_2d_body_exited(body: Node2D) -> void:
	if(body.name == "Ghost"):
		show_thoughts = false;


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://plinko_3.tscn");
