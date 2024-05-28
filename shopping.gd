extends Node2D

@onready var food = $groceries;
@onready var food2 = $groceries2;
@onready var food3 = $groceries3;
@onready var food4 = $groceries4;
@onready var food5 = $groceries5;
@onready var food6 = $groceries6;
@onready var food7 = $groceries7;

@onready var mid = $middle;

@onready var cost = $cost;

#seems like there's a bug when trying to add in the editor, so doing it manually 
@onready var food_array : Array = [food, food2, food3, food4, food5, food6, food7];
@onready var start_pos : Array[Vector2] = [food.position, food2.position, food3.position, food4.position, food5.position, food6.position, food7.position];

var total_cost : int = 0;
var amount_to_add : Array[int] = [7, 6, 3, 30, 5, 4, 20];
var in_basket : Array = [false, false, false, false, false, false, false];
#idk why I'm doing it this way 

func _ready() -> void:
	#setting basket position for later
	for i in range(food_array.size()):
		food_array[i].basket_pos = $basket.position;
		food_array[i].left = mid.position.x - 240;
		food_array[i].right = mid.position.x + 240;


func _process(_delta: float) -> void:
	cost.text = "Total: $" + str(total_cost);
	
	#resets everything when game is over
	if(!visible):
		for i in range(food_array.size()):
			food_array[i].position = start_pos[i];
   
	#checks to see whether food item is in basket and adds cost of specific item
	for i in range(food_array.size()):
		if(food_array[i].position == food_array[i].basket_pos && !in_basket[i]):
			total_cost += amount_to_add[i];
			in_basket[i] = true;
		elif(food_array[i].position == start_pos[i] && in_basket[i]):
			total_cost -= amount_to_add[i];
			in_basket[i] = false; 

func _on_button_pressed() -> void:
	#ends game as long as player doesn't go over budget
	if(total_cost <= Game.money):
		Game.money -= total_cost;
		Game.right_active = false;
		visible = false;


func _on_timer_timeout() -> void:
	Game.right_active = true;
