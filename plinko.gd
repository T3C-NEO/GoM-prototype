extends Node2D

@onready var prong = preload("res://prong.tscn");
@onready var chip = $chip;

var columnsA : int = 6;
var columnsB : int = 5;

var rows : int = 4;


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
	pass


func _on_button_pressed() -> void:
	chip.drop = true;


func _on_button_2_pressed() -> void:
	Game.CEODone = true
	get_tree().change_scene_to_file("res://overworld0.tscn")




func _on_rigid_body_2d_2_body_entered(body: Node) -> void:
	if(body.name == "chip"):
		print("Ds")
