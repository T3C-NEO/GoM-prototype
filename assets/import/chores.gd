extends Node2D

var squee
var cleaned = 9
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	squee = get_node("Squeegee")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse = get_local_mouse_position()
	squee.position.y = mouse.y
	if mouse.x > 50 and mouse.x < 525:
		squee.position.x = mouse.x
	if cleaned == 0:
		visible = false
		cleaned = 9
		get_node("Background2/Icon").visible = true
		get_node("Background2/Icon2").visible = true
		get_node("Background2/Icon3").visible = true
		get_node("Background2/Icon4").visible = true
		get_node("Background2/Icon5").visible = true
		get_node("Background2/Icon6").visible = true
		get_node("Background2/Icon7").visible = true
		get_node("Background2/Icon8").visible = true
		get_node("Background2/Icon9").visible = true



func _on_area_2d_mouse_exited() -> void:
	if Input.is_action_pressed("mouse_left"):
		get_node("Background2/Icon").visible = false
		visible = false


func _on_area_2d_mouse_entered() -> void:
	pass # Replace with function body.
