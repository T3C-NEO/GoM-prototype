extends Node2D

var baby
var chore
var shop
var games
var curren
var num
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rng.randomize()
	baby = get_node("baby changing station")
	chore = get_node("chores")
	shop = get_node("shopping")
	games = [baby, chore, shop]
	num = rng.randi_range(0, games.size()-1)
	games[num].visible = true
	curren = num


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if baby.visible == false and chore.visible == false and shop.visible == false:
		while num == curren:
			num = rng.randi_range(0, games.size()-1)
			print(num , " : " , curren)
		print("end")
		curren = num
		games[num].visible = true
		
