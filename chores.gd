extends Node2D

@onready var text = $Label;


var squee
var cleaned = 9
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text.scale = Vector2.ZERO;
	squee = get_node("Squeegee")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var tween = get_tree().create_tween();
	tween.tween_property(text, "scale", Vector2(1, 1), 3);
	
	var mouse = get_local_mouse_position()
	squee.position.y = mouse.y
	if mouse.x > 50 and mouse.x < 525:
		squee.position.x = mouse.x
	if cleaned == 0:
		text.visible = false;
		visible = false
		Game.right_active = false;
		cleaned = 9
		get_node("GrayBg").visible = true
		get_node("GrayBg/Icon").visible = true
		get_node("GrayBg/Icon2").visible = true
		get_node("GrayBg/Icon3").visible = true
		get_node("GrayBg/Icon4").visible = true
		get_node("GrayBg/Icon5").visible = true
		get_node("GrayBg/Icon6").visible = true
		get_node("GrayBg/Icon7").visible = true
		get_node("GrayBg/Icon8").visible = true
		get_node("GrayBg/Icon9").visible = true



func _on_area_2d_mouse_exited() -> void:
	if Input.is_action_pressed("mouse_left"):
		#get_node("GrayBg/Icon").visible = false
		visible = false


func _on_area_2d_mouse_entered() -> void:
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	Game.right_active = true;
