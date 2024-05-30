extends Node2D

@onready var prong = preload("res://Prong.tscn");
@onready var chip = $chip;
@onready var brains = $CanvasLayer/Label;
@onready var goal = $Label8;

@onready var slides = $Slides;
@onready var left_slide = $Slides/left_slide;
@onready var right_slide = $Slides/right_slide; 

@onready var big = $Label8/Big;
@onready var small = $Label8/small;

var landed : bool = false;

var moving : bool = false;
var setPos : bool = false;
var coolPos;

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
	if (moving):
		var tween = get_tree().create_tween();
		tween.tween_property(get_node("chip/cam"), "offset", Vector2.ZERO, 3).set_trans(Tween.TRANS_LINEAR);
		await tween.finished;
		moving = false;
	
		#moving = false;
		#chip.position = Vector2(128, 237);
		
	move_slides();

func _on_button_pressed() -> void:
	chip.drop = true;


func _on_button_2_pressed() -> void:
	Game.CEODone = true
	Game.sliders_active = false;
	#get_tree().change_scene_to_file("res://overworld0.tscn")


func move_slides():
	if(chip.stop):
		var tween = get_tree().create_tween().set_parallel(true);
		tween.tween_property(left_slide, "position", Vector2(268.08, 3311.67), 3);
		tween.tween_property(right_slide, "position", Vector2(888.365, 3311.67), 3);
		
		await tween.finished;
		chip.freeze = false;

func _on_big_timeout() -> void:
	biging = true;
	small.start()

func _on_small_timeout() -> void:
	biging = false;
	big.start()


func _on_help_25_body_entered(body: Node2D) -> void:
	if(body.name == "chip" and landed == false):
		Game.PlinkNum += 100;
		landed = true;
		
func _on_help_15_body_entered(body: Node2D) -> void:
	if(body.name == "chip" and landed == false):
		Game.PlinkNum += 10;
		landed = true;
		
func _on_help_5_body_entered(body: Node2D) -> void:
	if(body.name == "chip" and landed == false):
		Game.PlinkNum += 1;
		landed = true;


func _on_timer_timeout() -> void:
	moving = true;
	#chip.position = Vector2(128, 237);
	get_node("chip/cam").position_smoothing_speed = 2;



func _on_slide_timer_timeout() -> void:
	slides.visible = true;
