extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	Game.CEODone = false;
	Game.DebtDone = false;
	Game.OctoDone = false;
	Game.demoDone = false;
	Game.sliders_active = true; 
	Game.final_plinko = false;
	Game.PlinkNum = 0;
	get_tree().change_scene_to_file("res://menu.tscn")
