extends Node2D

@onready var prong = preload("res://Prong.tscn");
@onready var chip = $chip;

var columnsA : int = 6;
var columnsB : int = 5;

var rows : int = 9;

var win : bool;
var lose : bool;


func _ready() -> void:
	Game.final_plinko = true;
	
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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("mouse_left")):
		chip.drop = true;
	
	if(win || lose):
		var timer = get_tree().create_timer(2);
		await timer.timeout;
		Game.demoDone = true;
		get_tree().change_scene_to_file("res://overworld_4.tscn");


func _on_win_body_entered(body: Node2D) -> void:
	if(body.name == "chip"):
		win = true;


func _on_lose_detection_body_entered(body: Node2D) -> void:
	if(body.name == "chip"):
		lose = true;
