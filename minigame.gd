extends Node2D

var debt = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (debt == 0):
		get_tree().change_scene_to_file("res://overworld2.tscn")
		
		


func _on_button_2_pressed() -> void:
	debt -= 1
