extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_rigid_body_2d_2_body_entered(body: Node) -> void:
	if(body.name == "chip"):
		print("Dsfss")


func _on_timer_timeout() -> void:
	Game.CEODone = true
	get_tree().change_scene_to_file("res://overworld0.tscn")
