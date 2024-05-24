extends Node2D

@onready var prong = preload("res://debt_popup.tscn");
var debt = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (debt == 0):
		Game.DebtDone = true
		get_tree().change_scene_to_file("res://overworld.tscn")
	if (Input.is_action_pressed("mouse_left")):
		var prongs = prong.instantiate();
		prongs.position = Vector2(250, 555);
		add_child(prongs);
		


func _on_button_2_pressed() -> void:
	debt -= 1
