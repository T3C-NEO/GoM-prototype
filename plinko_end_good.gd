extends Label


var reached_bottom : bool;

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if(reached_bottom):
		var timer = get_tree().create_timer(2);
		await timer.timeout;
		if(Game.PlinkNum >= 50):
			Game.CEODone = true
			get_tree().change_scene_to_file("res://overworld0.tscn")
		else:
			get_tree().reload_current_scene();
		

func _on_rigid_body_2d_2_body_entered(body: Node) -> void:
	if(body.name == "chip"):
		#print("Dsfss")
		reached_bottom = true;


func _on_timer_timeout() -> void:
	pass
	#Game.CEODone = true
	#get_tree().change_scene_to_file("res://overworld0.tscn")
