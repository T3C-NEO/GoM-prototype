extends Node2D

@onready var money = $money;
@onready var work = $work;
@onready var tentacles = $bottom_tentacles;
@onready var progress = $ProgressBar;
@onready var shopping = $right/shopping;

var target_time : float = 60.0;


func _ready() -> void:
	randomize()


func _process(delta: float) -> void:
	money.text = "$" + str(Game.money) + ".00"
	
	change_color();

	target_time -= delta;
	progress.value = map(target_time, 60.0, 0.0, 100.0, 0.0);
	
	if(progress.value <= 0):
		end_level();
	
	if(tentacles.screen_covered || Game.money <= -10):
		lose_level();
		
	if(work.orders_served):
		$Timer.stop();
		$Left_Timer.stop();
		$Timer.set_wait_time(10);
		$Left_Timer.set_wait_time(10);
		$Timer.start();
		$Left_Timer.start();
		work.orders_served = false;
		
	#print($Timer.time_left)
	
func change_color():
	if(shopping.can_afford):
		money.add_theme_color_override("font_color", Color.WHITE);
	else:
		money.add_theme_color_override("font_color", Color.RED);


func _on_button_pressed() -> void:
	end_level();


func _on_timer_timeout() -> void:
	work.cancel_order = true;
	$Timer.wait_time = 7;


func _on_left_timer_timeout() -> void:
	Game.left_active = true;
	#print("YERRR");


func _on_right_timer_timeout() -> void:
	#Game.right_active = true;
	pass


func end_level():
	Game.OctoDone = true
	get_tree().change_scene_to_file("res://overworld3.tscn")
	
func lose_level():
	get_tree().change_scene_to_file("res://overworld3.tscn");

func map(value: float, minA: float, maxA: float, minB: float, maxB: float) -> float:
	var range : float = maxA - minA;
	var value_percent : float = (value - minA) / range;
	
	var new_range : float = maxB - minB;
	
	return value_percent * new_range + minB;
