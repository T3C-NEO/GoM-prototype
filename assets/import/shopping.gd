extends Node2D

@onready var food = $groceries;
@onready var food2 = $groceries2;
@onready var food3 = $groceries3;
@onready var food4 = $groceries4;
@onready var food5 = $groceries5;
@onready var food6 = $groceries6;
@onready var food7 = $groceries7;

@onready var mid = $middle;

#seems like there's a bug when trying to add in the editor, so doing it manually 
@onready var food_array : Array = [food, food2, food3, food4, food5, food6, food7];


func _ready() -> void:
	for i in range(food_array.size()):
		food_array[i].basket_pos = $basket.position;
		food_array[i].left = mid.position.x - 240;
		food_array[i].right = mid.position.x + 240;


func _process(delta: float) -> void:
	pass
	

func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.name == "food_detection"):
		pass


func _on_area_2d_area_exited(area: Area2D) -> void:
	if(area.name == "food_detection"):
		pass


func _on_button_pressed() -> void:
	visible = false;
