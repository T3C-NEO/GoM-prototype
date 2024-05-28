extends Node2D

@onready var icon1 = $Icon;
@onready var icon2 = $Icon2;
@onready var icon3 = $Icon3;
@onready var icons : Array = [icon1, icon2, icon3];

var old_texture = preload("res://assets/order_incomplete.png");
var new_texture = preload("res://assets/order_complete_gray.png");

var index : int = 0;
var change_color : bool; 

var orders_served : bool; 
var cancel_order : bool;
var amount_to_deduct : int = 0;
var dont_add = [false, false, false];

var brown1
var brown2
var brown3
var brown4
var rng = RandomNumberGenerator.new()
var fills 
var total = 3
var num
var totals
var totals1
var totals2
var totals3

func _ready() -> void:
	rng.randomize()
	brown1 = get_node("Brown")
	brown2 = get_node("Brown2")
	brown3 = get_node("Brown3")
	brown4 = get_node("Brown4")
	totals1 = get_node("Icon")
	totals2 = get_node("Icon2")
	totals3 = get_node("Icon3")
	fills = [brown1, brown2, brown3, brown4]
	totals = [totals1, totals2, totals3]
	totals1.visible = true
	totals2.visible = true
	totals3.visible = true
	num = rng.randi_range(0, 3)
	for n in num:
		fills[n].visible = true
	num-=1
	

func _process(delta: float) -> void:
	if(change_color):
		amount_to_deduct = 0; 
		for i in range(icons.size()):
			if(icons[2].modulate.a > 0):
				icons[i].modulate.a -= 2 * delta;
			else:
				change_color = false;
				if(!dont_add[i]):
					Game.money += 2;
				dont_add[i] = false;
				icons[i].texture = old_texture;
				icons[i].modulate.a = 1;
			
	elif(cancel_order):
		for i in range(icons.size()):
			if(icons[i].texture == old_texture):
				amount_to_deduct += 2;
				dont_add[i] = true;
		Game.money -= amount_to_deduct;
		#print(amount_to_deduct)
		index = 0;
		change_color = true;
		cancel_order = false;

		
func _on_button_pressed() -> void:
	num+=1
	if num < fills.size():
		fills[num].visible = true
	else:
		Game.money -= 2;
		reset_fill();


func _on_done_pressed() -> void:
	if num == 3:
		icons[index].texture = new_texture;
		if(index < 2):
			index += 1;
		else:
			index = 0;
			Game.left_active = false;
			orders_served = true;
			change_color = true;

		reset_fill();

	else:
		Game.money -= 2;
		reset_fill();

func reset_fill() -> void:
	brown1.visible = false
	brown2.visible = false
	brown3.visible = false
	brown4.visible = false
		
	num = rng.randi_range(0, 3)
	for n in num:
		fills[n].visible = true
	num-=1
