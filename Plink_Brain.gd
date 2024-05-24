extends Node2D


@onready var time = $Timer;
@onready var prong = $Prong2;
#@onready var prong = preload("res://prong.tscn");
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	prong.modulate.a = time.time_left
	position.y -= 200 * delta;


func _on_timer_timeout() -> void:
	queue_free()
