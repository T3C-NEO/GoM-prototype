extends Node2D

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
# Called when the node enters the scene tree for the first time.
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
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("mouse_left"):
		get_node("Lose").visible = false

func _on_button_pressed() -> void:
	num+=1
	if num < fills.size():
		fills[num].visible = true
	else:
		get_node("Lose").visible = true


func _on_done_pressed() -> void:
	if num == 3:
		brown1.visible = false
		brown2.visible = false
		brown3.visible = false
		brown4.visible = false
		num = rng.randi_range(0, 3)
		for n in num:
			fills[n].visible = true
		num-=1
		#total -=1
		#totals[total].visible = false
		#if total == 0:
			#total = 3
			#visible = false
			#totals1.visible = true
			#totals2.visible = true
			#totals3.visible = true
			#num = rng.randi_range(0, 3)
			#for n in num:
				#fills[n].visible = true
			#num-=1
	else:
		get_node("Lose").visible = true
