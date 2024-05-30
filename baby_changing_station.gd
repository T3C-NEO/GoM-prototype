extends Node2D

@onready var text = $Label;
var step1 = 2


func _ready() -> void:
	text.scale = Vector2.ZERO;


func _process(_delta: float) -> void:
	var tween = get_tree().create_tween();
	tween.tween_property(text, "scale", Vector2(1, 1), 3);
	
	if step1 == 0:
		get_node("Icon3").visible = true
	if step1 == -4:
		step1 = 2;
		get_node("Icon").visible = true
		get_node("Icon2").visible = true
		text.visible = false;
		visible = false
		Game.right_active = false;
		
		


func _on_button_pressed() -> void:
	get_node("Icon").visible = false
	step1 -= 1;

func _on_button_2_pressed() -> void:
	get_node("Icon2").visible = false
	step1 -= 1;

func _on_button_3_pressed() -> void:
	if step1 == 0:
		step1 -= 1;
		get_node("Icon3").visible = false
		get_node("Icon4").visible = true
	if step1 == -2:
		get_node("Icon").visible = true
		get_node("Icon2").visible = true
		get_node("Icon3").visible = false


func _on_button_4_pressed() -> void:
	get_node("Icon3").visible = true
	get_node("Icon4").visible = false
	step1 -= 1;


func _on_timer_timeout() -> void:
	Game.right_active = true;
