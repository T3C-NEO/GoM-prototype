extends Node2D



func _process(_delta: float) -> void:
	#one second buffer for any trigger happy players
	var timer = get_tree().create_timer(1);
	await timer.timeout;
	if(Input.is_action_just_pressed("mouse_left")):
		get_tree().change_scene_to_file("res://plinko.tscn");
