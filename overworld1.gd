extends Node2D

var playBox;
var playBox2;
@onready var ghost = $CharacterBody2D;
@onready var plinko2Done = $plinko2Done;
@onready var debtDone = $debtDone;

func _ready() -> void:
	playBox = 	get_node("play");
	playBox2 = 	get_node("play2");
	Game.floor = 5;
	if Game.DebtDone == true:
		get_node("Bad").visible = false;
		#get_node("Button").queue_free();
		$Lauren3.visible = false;
		$Lauren2.visible = true;
	if Game.CEODone == true:
		get_node("Bad2").visible = false;
		#get_node("Button4").queue_free();
	if (Game.ghostPos != Vector2(0,0)):
		ghost.position = Game.ghostPos;
	
		
func _process(delta: float) -> void:
	if (ghost.position.x > 1105 and ghost.position.x < 1405):
		if (Game.DebtDone == false):
			playBox.visible = true;
		else:
			debtDone.visible = true;
	else:
		playBox.visible = false;
		debtDone.visible = false;
		
	#if (ghost.position.x > 0 and ghost.position.x < 500):
		#if (Game.CEODone == false):
			#playBox2.visible = true;
		#else:
			#plinko2Done.visible = true;
	#else:
		#playBox2.visible = false;
		#plinko2Done.visible = false;
		#

func _on_button_pressed() -> void:
	if playBox.visible == false:
		playBox.visible = true
	else:
		playBox.visible = false
	
#	get_tree().change_scene_to_file("res://loading.tscn")


func _on_button_2_pressed() -> void:
	if Game.DebtDone == false:
		get_node("CharacterBody2D/textNode").visible = true
		await get_tree().create_timer(2.0).timeout
		get_node("CharacterBody2D/textNode").visible = false
	else:
		get_tree().change_scene_to_file("res://pannel.tscn")
		

func _on_play_button_pressed() -> void:
	Game.ghostPos = ghost.position
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
