extends Node2D



func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://loading.tscn")


func _on_button_2_pressed() -> void:
	get_node("CharacterBody2D/textNode").visible = true
	await get_tree().create_timer(2.0).timeout
	get_node("CharacterBody2D/textNode").visible = false
