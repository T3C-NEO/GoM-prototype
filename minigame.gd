extends Node2D

@onready var prong = preload("res://debt_popup.tscn");


var randX;
var randY;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Game.works == 0):
		Game.DebtDone = true
		get_tree().change_scene_to_file("res://overworld.tscn")


func _on_timer_timeout() -> void:
	var prongs = prong.instantiate();
	randX = randf_range(207,942);
	randY = randf_range(116,536);
	
	prongs.position = Vector2(randX, randY);
	add_child(prongs);
	$Timer.wait_time = randf_range(1,3);
