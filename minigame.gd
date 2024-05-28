extends Node2D

@onready var prong = preload("res://debt_popup.tscn");

var barEnd = Vector2(1637,288)

@onready var grayBars : Array = [$GrayBar1,$GrayBar2,$GrayBar3,$GrayBar4,$GrayBar5]

var randX;
var randY;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Game.works = 5;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Game.works == 0):
		Game.DebtDone = true
		get_tree().change_scene_to_file("res://overworld.tscn")
	$ProgressBar.position = $ProgressBar.position.lerp(barEnd, delta/2)
	if ($ProgressBar.position.x > 1400):
		$ProgressBar.position.x = 949;
	if (Game.works < 5 and grayBars[Game.works].visible == true):
		grayBars[Game.works].visible = false;
	


func _on_timer_timeout() -> void:
	var prongs = prong.instantiate();
	randX = randf_range(207,942);
	randY = randf_range(116,536);
	
	prongs.position = Vector2(randX, randY);
	add_child(prongs);
	$Timer.wait_time = randf_range(1,3);
