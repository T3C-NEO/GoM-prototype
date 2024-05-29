extends Node2D


var barEnd = Vector2(1500,391)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$ProgressBar.position = $ProgressBar.position.lerp(barEnd, delta/2)
	if ($ProgressBar.position.x > 1043):
		$ProgressBar.position.x = 592;


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://overworld.tscn")
