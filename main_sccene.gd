extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("mouse_left"):
		get_node("left/baby changing station").visible = true
		get_node("right/baby changing station").visible = true
