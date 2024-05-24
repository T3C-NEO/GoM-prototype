extends Node2D

var step1 = 2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if step1 == 0:
		get_node("Icon3").visible = true
	if step1 == -4:
		step1 = 2;
		get_node("Icon").visible = true
		get_node("Icon2").visible = true
		visible = false
		
		


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
