extends Node2D

var baby
var chore
var shop
var games
var curren
var num
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	rng.randomize()
	baby = get_node("baby changing station")
	chore = get_node("chores")
	shop = get_node("shopping")
	games = [baby, chore, shop]
	
	num = rng.randi_range(0, games.size()-1)
	games[num].visible = true
	curren = num


func _process(_delta: float) -> void:
	og_random_select();

	if(chore.visible || shop.visible):
		if(baby.visible):
			baby.visible = false;


func og_random_select():
	if baby.visible == false and chore.visible == false and shop.visible == false:
		while num == curren:
			num = rng.randi_range(0, games.size()-1)
			print(num , " : " , curren)
		print("end")
		curren = num
		games[num].visible = true
