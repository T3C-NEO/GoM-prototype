extends Node2D


var playBox;

func _ready() -> void:
	playBox = 	get_node("play");
	if Game.OctoDone == true:
		get_node("Bad").visible = false
		get_node("Button").queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if playBox.visible == false:
		playBox.visible = true
	else:
		playBox.visible = false


func _on_button_2_pressed() -> void:
	if Game.OctoDone == false:
		get_node("CharacterBody2D/textNode").visible = true
		await get_tree().create_timer(2.0).timeout
		get_node("CharacterBody2D/textNode").visible = false
	else:
		if get_node("NextFloor").visible == false:
			get_node("NextFloor").visible = true
		else:
			get_node("NextFloor").visible = false


func _on_button_3_pressed() -> void:
	Game.CEODone = false
	Game.DebtDone = false
	Game.OctoDone = false
	get_tree().change_scene_to_file("res://loading3.tscn")


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Main sccene.tscn")
