extends Node2D


@onready var time = $Timer;
@onready var time2 = $Timer2;

@onready var debt = $DebtPopup;

@onready var ads = [$DebtPopup, $"AllFees-DebtAd",$"YouAreThe100,000,000Visitor-WorkAd"];

var i;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	i = randi_range(0,2)
	ads[i].visible = true;
	ads[i].scale.y = 1-(time2.time_left*4);
	ads[i].scale.x = 1-(time2.time_left*4);
	ads[i].modulate.g = time.time_left;
	ads[i].modulate.b = time.time_left;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ads[i].scale.y = 1-(time2.time_left*4);
	ads[i].scale.x = 1-(time2.time_left*4);
	ads[i].modulate.g = time.time_left;
	ads[i].modulate.b = time.time_left;


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://lose.tscn")


func _on_button_pressed() -> void:
	queue_free();
