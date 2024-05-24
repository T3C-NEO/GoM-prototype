extends Node2D

@onready var money = $money;
@onready var work = $work;

func _ready() -> void:
	randomize()



func _process(_delta: float) -> void:
	money.text = "$" + str(Game.money) + ".00"
	
	if(work.orders_served):
		$Timer.stop();
		$Timer.set_wait_time(10);
		$Timer.start();
		work.orders_served = false;
		
	print($Timer.time_left)
	if Input.is_action_pressed("mouse_left"):
		#get_node("left/baby changing station").visible = true
		#get_node("right/baby changing station").visible = true
		pass


func _on_button_pressed() -> void:
	Game.OctoDone = true
	get_tree().change_scene_to_file("res://overworld3.tscn")


func _on_timer_timeout() -> void:
	work.cancel_order = true;
	$Timer.wait_time = 7;
