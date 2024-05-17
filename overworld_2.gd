extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_button_2_pressed() -> void:
	if (get_node("NextFloor").visible == true):
		get_node("NextFloor").visible = false
	else:
		get_node("NextFloor").visible = true


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://overworld3.tscn")
