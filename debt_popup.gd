extends Node2D


@onready var time = $Timer;
@onready var time2 = $Timer2;

@onready var debt = $DebtPopup;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	debt.scale.y = 1-(time2.time_left*4);
	debt.scale.x = 1-(time2.time_left*4);
	debt.modulate.g = time.time_left;
	debt.modulate.b = time.time_left;


func _on_timer_timeout() -> void:
	pass # Replace with function body.
