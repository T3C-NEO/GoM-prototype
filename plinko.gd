extends Node2D

@onready var prong = preload("res://prong.tscn");
@onready var chip = $chip;
@onready var brains = $CanvasLayer/Label;
@onready var goal = $Label8;

@onready var slides = $Slides;

@onready var big = $Label8/Big;
@onready var small = $Label8/small;

var columnsA : int = 6;
var columnsB : int = 5;

var rows : int = 9;

var biging = false;
var fontSize = 80;


func _ready() -> void:
	for row in range(rows):
		for col in range(columnsA):
			var prongs = prong.instantiate();
			prongs.position = Vector2(190 + col * 150, 410 + row * 300);
			add_child(prongs);

	for row in range(rows):
		for col in range(columnsB):
			var prongs = prong.instantiate();
			prongs.position = Vector2(250 + col * 160, 555 + row * 300);
			add_child(prongs);


func _process(_delta: float) -> void:
	if Game.PlinkNum < 10:
		brains.text = "0"+str(Game.PlinkNum)+"/50";
	else:
		brains.text = str(Game.PlinkNum)+"/50";
	goal.add_theme_font_size_override("font_size",fontSize)
	if biging == false:
		fontSize -= 5;
	else:
		fontSize += 5;

func _on_button_pressed() -> void:
	chip.drop = true;


func _on_button_2_pressed() -> void:
	Game.CEODone = true
	get_tree().change_scene_to_file("res://overworld0.tscn")


func _on_big_timeout() -> void:
	biging = true;
	small.start()

func _on_small_timeout() -> void:
	biging = false;
	big.start()


func _on_help_25_body_entered(body: Node2D) -> void:
	if(body.name == "chip"):
		Game.PlinkNum += 25; 
		
func _on_help_15_body_entered(body: Node2D) -> void:
	if(body.name == "chip"):
		Game.PlinkNum += 15; 
		
func _on_help_5_body_entered(body: Node2D) -> void:
	if(body.name == "chip"):
		Game.PlinkNum += 5; 


func _on_timer_timeout() -> void:
	chip.position = Vector2(128, 237);
	get_node("chip/cam").position_smoothing_speed = 2;


func _on_slide_timer_timeout() -> void:
	slides.visible = true;




