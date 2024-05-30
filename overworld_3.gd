extends Node2D


var playBox;
var playBox2;
@onready var ghost = $CharacterBody2D;
@onready var octodone = $octodone;
@onready var plinko2Done = $plinko2Done;

func _ready() -> void:
	playBox = 	get_node("play");
	playBox2 = 	get_node("play2");
	Game.floor = 4;
	if Game.OctoDone == true:
		get_node("Bad").visible = false
		$Kotorah1.visible = false;
		$Kotorah2.visible = true;
		#get_node("Button").queue_free()
	ghost.position = Game.ghostPos;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if (ghost.position.x > 993 and ghost.position.x < 1293):
		if (Game.OctoDone == false):
			playBox.visible = true;
		else:
			octodone.visible = true;
	else:
		playBox.visible = false;
		octodone.visible = false;
		
	if (ghost.position.x > 384 and ghost.position.x < 684):
		if (Game.CEODone == false):
			playBox2.visible = true;
		else:
			plinko2Done.visible = true;
	else:
		playBox2.visible = false;
		plinko2Done.visible = false;
		


func _on_button_pressed() -> void:
	if playBox.visible == false:
		playBox.visible = true
	else:
		playBox.visible = false


func _on_button_2_pressed() -> void:
	if Game.OctoDone == false and Game.CEODone == false:
		get_node("CharacterBody2D/textNode").visible = true
		await get_tree().create_timer(2.0).timeout
		get_node("CharacterBody2D/textNode").visible = false
	else:
		get_tree().change_scene_to_file("res://pannel.tscn")


func _on_button_3_pressed() -> void:
	Game.CEODone = false
	Game.DebtDone = false
	Game.OctoDone = false
	get_tree().change_scene_to_file("res://loading3.tscn")


func _on_play_button_pressed() -> void:
	Game.ghostPos = ghost.position;
	get_tree().change_scene_to_file("res://Main sccene.tscn")


func _on_play_button_2_pressed() -> void:
	Game.ghostPos = ghost.position;
	get_tree().change_scene_to_file("res://plinko2.tscn")
