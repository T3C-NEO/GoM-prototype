extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_pressed("mouse_left"):
		get_node("left/baby changing station").visible = true
		get_node("right/baby changing station").visible = true


func _on_button_pressed() -> void:
	Game.OctoDone = true
	get_tree().change_scene_to_file("res://overworld3.tscn")
