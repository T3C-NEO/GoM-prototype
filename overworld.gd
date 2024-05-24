extends Node2D

var playBox;
@onready var tap = $TapHere;
@onready var timer = $TapHere/Timer;
var clicked = true;

func _ready() -> void:
	playBox = 	get_node("play");
	Game.floor = 6;
	if Game.CEODone == true:
		get_node("Bad").visible = false
		get_node("Button").queue_free()
		
func _process(_delta: float) -> void:
	if (clicked == false):
		tap.modulate.a = 1-(timer.time_left);
	if (clicked == true):
		tap.modulate.a = (timer.time_left);
	if (clicked == false and Input.is_action_pressed("mouse_left")):
		clicked = true;
		timer.start();
	
func _on_button_pressed() -> void:
	if playBox.visible == false:
		playBox.visible = true
	else:
		playBox.visible = false
	
#	get_tree().change_scene_to_file("res://loading.tscn")


func _on_button_2_pressed() -> void:
	if Game.CEODone == false:
		get_node("CharacterBody2D/textNode").visible = true
		await get_tree().create_timer(2.0).timeout
		get_node("CharacterBody2D/textNode").visible = false
	else:
		get_tree().change_scene_to_file("res://pannel.tscn")
		if (Game.DebtDone == false):
			Game.CEODone = false
			Game.PlinkNum = 0
		

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://plinko.tscn")
	


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://pannel.tscn")
	Game.CEODone = false
	Game.PlinkNum = 0


func _on_timer_2_timeout() -> void:
	timer.start();
	clicked = false;
