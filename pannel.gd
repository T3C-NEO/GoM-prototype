extends Node2D


@onready var ghost = $Panel/Ghost;
@onready var timer = $Panel/Timer;
@onready var lock = $Panel/Lock;


var going;
var starting;

var f6 : Vector2 = Vector2(-16, -302);
var f5 : Vector2 = Vector2(137, -304);
var f4 : Vector2 = Vector2(-6, -155);
var f3 : Vector2 = Vector2(-345, -23);
var f2 : Vector2 = Vector2(181, 424);
var fL : Vector2 = Vector2(-345, 424);
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (Game.floor == 6):
		ghost.position = f6
	elif (Game.floor == 5):
		ghost.position = f5
	elif (Game.floor == 4):
		ghost.position = f4
	if (Game.DebtDone == false):
		lock.visible = true;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (going == 6):
		ghost.position = ghost.position.lerp(f6, delta * 4)
	elif (going == 5):
		ghost.position = ghost.position.lerp(f5, delta * 4)
	elif (going == 4):
		ghost.position = ghost.position.lerp(f4, delta * 4)


func _on_button_5_pressed() -> void:
	if (lock.visible == false):
		going = 4;
		timer.start();
		$PanelCloseButton.visible = false;


func _on_button_6_pressed() -> void:
	going = 5;
	timer.start();
	$PanelCloseButton.visible = false;


func _on_timer_timeout() -> void:
	$PanelCloseButton.visible = true;

func _on_button_7_pressed() -> void:
	going = 6;
	timer.start();
	$PanelCloseButton.visible = false;


func _on_button_close_pressed() -> void:
	if (going == 6):
		get_tree().change_scene_to_file("res://overworld0.tscn")
	elif (going == 5):
		get_tree().change_scene_to_file("res://overworld.tscn")
	elif (going == 4):
		get_tree().change_scene_to_file("res://overworld3.tscn")
