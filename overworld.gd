extends Node2D

var playBox;
@onready var tap = $TapHere;
@onready var timer = $TapHere/Timere;
@onready var timer4 = $Ghost/Timer4;
var clicked = true;

@onready var ghost = $Ghost;
@onready var time2 = $Ghost/Timer;

func _ready() -> void:
	playBox = 	get_node("play");
	Game.floor = 6;
	if Game.CEODone == true:
		get_node("Bad").visible = false
		get_node("Button").queue_free()
		
func _process(delta: float) -> void:
	if (clicked == false):
		tap.modulate.a = 1-(timer.time_left);
	if (clicked == true):
		tap.modulate.a = (timer.time_left);
	if (clicked == false and Input.is_action_pressed("mouse_left")):
		clicked = true;
		timer.start();
	if ($CharacterBody2D.position.x < 500):
		$BossSketchRoom2.visible = true;
	else:
		$BossSketchRoom2.visible = false;
	
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
	Game.sliders_active = true;
	get_tree().change_scene_to_file("res://plinko.tscn")
	


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://pannel.tscn")
	Game.CEODone = false
	Game.PlinkNum = 0


func _on_timer_2_timeout() -> void:
	timer.start();
	clicked = false;


func _on_timer_timeout() -> void:
	$CharacterBody2D.visible = true;
	ghost.visible = false;


func _on_timer_4_timeout() -> void:
	var tween = create_tween();
	tween.set_parallel(true);
	tween.tween_property(ghost, "position", Vector2(1050,162), 1)
	tween.tween_property(ghost, "scale", Vector2(0.645,0.645), 1)
	#clicked = false;
	$TapHere/Timer2.start();
