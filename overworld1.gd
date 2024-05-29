extends Node2D

var playBox;
var playBox2;
@onready var ghost = $CharacterBody2D;

func _ready() -> void:
	playBox = 	get_node("play");
	playBox2 = 	get_node("play2");
	Game.floor = 5;
	if Game.DebtDone == true:
		get_node("Bad").visible = false;
		get_node("Button").queue_free();
	if Game.CEODone == true:
		get_node("Bad2").visible = false;
		get_node("Button4").queue_free();
		
func _process(delta: float) -> void:
	if (ghost.position.x > 2200 and ghost.position.x < 2750):
		playBox.visible = true;
	else:
		playBox.visible = false;
		

func _on_button_pressed() -> void:
	if playBox.visible == false:
		playBox.visible = true
	else:
		playBox.visible = false
	
#	get_tree().change_scene_to_file("res://loading.tscn")


func _on_button_2_pressed() -> void:
	if Game.DebtDone == false or Game.CEODone == false:
		get_node("CharacterBody2D/textNode").visible = true
		await get_tree().create_timer(2.0).timeout
		get_node("CharacterBody2D/textNode").visible = false
	else:
		get_tree().change_scene_to_file("res://pannel.tscn")
		

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://minigame.tscn")
	


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://overworld3.tscn")


func _on_button_4_pressed() -> void:
	if playBox2.visible == false:
		playBox2.visible = true
	else:
		playBox2.visible = false


func _on_play_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://plinko2.tscn")
